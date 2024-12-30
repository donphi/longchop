#!/bin/bash

##########################################################
# Default Values
##########################################################
show_help=false
codeline=500

# Arrays for ignoring or including
ignore_types=()
include_types=()

##########################################################
# Parse Parameters
##########################################################
while [[ $# -gt 0 ]]; do
  case $1 in
    --codeline)
      codeline="$2"
      shift 2
      ;;
    --ignore)
      ignore_types+=("$2")
      shift 2
      ;;
    --include)
      include_types+=("$2")
      shift 2
      ;;
    --help|-h)
      show_help=true
      shift
      ;;
    *)
      echo "Unknown option: $1"
      exit 1
      ;;
  esac
done

if [ "$show_help" = true ]; then
  echo "Usage: longchop [options]"
  echo ""
  echo "Options:"
  echo "  --codeline X      Show only the first X lines of each file (default 500)."
  echo "  --ignore .ext     Ignore files with the extension '.ext' in the listing."
  echo "  --include .ext    Include additional file types beyond the default set."
  echo "  --help, -h        Show this help message."
  exit 0
fi

##########################################################
# Helper Functions
##########################################################
function create_separator() {
    echo "───────┼────────────────────────────────────────────────────────────────────────"
}

function create_separator_bottom() {
    echo "───────┴────────────────────────────────────────────────────────────────────────"
}

function display_file_content() {
    local file=$1
    echo "       │ File: $file"
    create_separator

    # Only show up to $codeline lines
    line_num=1
    while IFS= read -r line || [[ -n "$line" ]]; do
        if (( line_num > codeline )); then
            break
        fi
        printf "%4d   │ %s\n" "$line_num" "$line"
        ((line_num++))
    done < "$file"
    
    create_separator_bottom
    echo
}

##########################################################
# Main Logic
##########################################################

# 1. Print directory structure
echo "Directory Structure:"
echo "==================="
tree -I 'node_modules|.git|dist|build|.next|coverage' --dirsfirst
echo

# 2. Default file types to show
#    Put them in parentheses with -o (logical OR).
#    For special Dockerfile naming, we separate it out a bit.
default_includes='( -name "*.Dockerfile" -o \
    -name "*.tsx" -o \
    -name "*.ts" -o \
    -name "*.jsx" -o \
    -name "*.js" -o \
    -name "*.json" -o \
    -name "*.html" -o \
    -name "*.css" -o \
    -name "*.scss" -o \
    -name "*.yaml" -o \
    -name "*.yml" )'

# 3. If --include parameters were provided, add them to the OR list.
#    For example: if user said "--include .svg", we add: -o -name "*.svg"
additional_includes=""
for inc in "${include_types[@]}"; do
  additional_includes+=" -o -name \"*${inc}\""
done

# 4. If the user provided `--ignore`, build a set of `-not -iname "*ext"` conditions.
ignore_expr=""
for ext in "${ignore_types[@]}"; do
  ignore_expr+=" -not -iname \"*${ext}\""
done

echo "Files with Contents:"
echo "==================="

# 5. Build the final 'find' command using eval so we can expand the strings properly.
#
# Putting it all together:
# find . -type f \( $default_includes $additional_includes \) \
#     (excluding certain directories) \
#     $ignore_expr
#

eval "find . -type f \
  \\( $default_includes $additional_includes \\) \
  -not -path '*/node_modules/*' \
  -not -path '*/.git/*' \
  -not -path '*/dist/*' \
  -not -path '*/build/*' \
  -not -path '*/.next/*' \
  -not -path '*/coverage/*' \
  $ignore_expr" | while read -r file; do
    dirname \"$file\" | sed 's/[^/]*\//│   /g'
    echo \"├── \$(basename \"$file\")\"
    display_file_content \"$file\"
done