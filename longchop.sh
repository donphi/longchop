#!/bin/bash

# Function to create separator line
function create_separator() {
    echo "───────┼────────────────────────────────────────────────────────────────────────"
}

function create_separator_bottom() {
    echo "───────┴────────────────────────────────────────────────────────────────────────"
}

# Function to display file content
function display_file_content() {
    local file=$1
    echo "       │ File: $file"
    create_separator
    
    # Read file line by line and add line numbers
    line_num=1
    while IFS= read -r line || [[ -n "$line" ]]; do
        printf "%4d   │ %s\n" "$line_num" "$line"
        ((line_num++))
    done < "$file"
    
    create_separator_bottom
    echo
}

# First display tree structure
echo "Directory Structure:"
echo "==================="
tree -I 'node_modules|.git|dist|build|.next|coverage' --dirsfirst

echo -e "\nFiles with Contents:"
echo "==================="

# Process each directory level and display contents for matching files
find . -type f \( \
    -name "*.tsx" -o \
    -name "*.Dockerfile" -o \
    -name "*.ts" -o \
    -name "*.jsx" -o \
    -name "*.js" -o \
    -name "*.json" -o \
    -name "*.html" -o \
    -name "*.css" -o \
    -name "*.scss" -o \
    -name "*.yaml" -o \
    -name "*.yml" \
    \) \
    -not -path "*/node_modules/*" \
    -not -path "*/.git/*" \
    -not -path "*/dist/*" \
    -not -path "*/build/*" \
    -not -path "*/.next/*" \
    -not -path "*/coverage/*" | while read -r file; do
        # Show the directory structure leading to this file
        dirname "$file" | sed 's/[^/]*\//│   /g'
        echo "├── $(basename "$file")"
        display_file_content "$file"
    done