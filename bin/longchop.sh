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
current_dir=$(basename "$PWD")
echo $current_dir
tree -I 'node_modules|.git|dist|build|.next|coverage' --dirsfirst | tail -n +2
echo

echo "Files with Contents:"
echo "==================="

# Build the find command
find_cmd="find . -type f \( "

# Add default file types
find_cmd+="-name '*.Dockerfile' -o "
find_cmd+="-name '*.tsx' -o "
find_cmd+="-name '*.ts' -o "
find_cmd+="-name '*.jsx' -o "
find_cmd+="-name '*.js' -o "
find_cmd+="-name '*.json' -o "
find_cmd+="-name '*.html' -o "
find_cmd+="-name '*.css' -o "
find_cmd+="-name '*.scss' -o "
find_cmd+="-name '*.yaml' -o "
find_cmd+="-name '*.yml'"

# Close the initial group
find_cmd+=" \)"

# Add include types if any
for inc in "${include_types[@]}"; do
    find_cmd+=" -o -name '*$inc'"
done

# Add standard exclusions
find_cmd+=" -not -path '*/node_modules/*'"
find_cmd+=" -not -path '*/.git/*'"
find_cmd+=" -not -path '*/dist/*'"
find_cmd+=" -not -path '*/build/*'"
find_cmd+=" -not -path '*/.next/*'"
find_cmd+=" -not -path '*/coverage/*'"

# Add ignore types if any
for ext in "${ignore_types[@]}"; do
    find_cmd+=" -not -iname '*$ext'"
done

eval "$find_cmd" | while read -r file; do
    dirname "$file" | sed 's/[^/]*\//│   /g'
    echo "├── $(basename "$file")"
    display_file_content "$file"
done