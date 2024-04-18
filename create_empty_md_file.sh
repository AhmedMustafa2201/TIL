#!/bin/bash

TIL_FILE="til_categories.txt"

# Function to display TIL categories from the file with numbers
display_categories() {
    echo "Available categories:"
    cat -n "$TIL_FILE"
}

# Function to create a new category
create_category() {
    echo -n "Enter the name of the new category: "
    read category
    echo "$category" >> "$TIL_FILE"
}

# Function to replace spaces with dashes
replace_spaces() {
    echo "$1" | tr ' ' '-'
}

# Main script starts here

# Display available categories with numbers
display_categories

# Ask for category number or to create a new one
while [[ -z "$selected_category" ]]; do
    echo -n "Enter the number of the category or type 'n' to create a new one: "
    read selected_category
    if [[ -z "$selected_category" ]]; then
        echo "Please enter something."
    fi
done

if [[ "$selected_category" == "n" ]]; then
    create_category
    display_categories
    echo -n "Enter the number of the newly created category: "
    read selected_category
fi

# Get the selected category name
selected_category_name=$(sed -n "${selected_category}p" "$TIL_FILE")

# Ask for the TIL name
while [[ -z "$til_name" ]]; do
    echo -e "\nEnter what you learned today (can contain spaces):"
    read til_name
    if [[ -z "$til_name" ]]; then
        echo "Please enter something."
    fi
done

# Replace spaces with dashes
til_name_slug=$(replace_spaces "$til_name")

# Create the category directory if it doesn't exist
mkdir -p "$selected_category_name"

# Create the file
touch "$selected_category_name/$til_name_slug.md"
echo "File created: $selected_category_name/$til_name_slug.md"
