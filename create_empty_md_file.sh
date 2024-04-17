#!/bin/bash

# Get the current date
current_date=$(date +"%Y-%m-%d")

# Define the filename
filename="$current_date.md"

# Create an empty Markdown file with the current date in the filename
touch "$filename"

echo "Empty Markdown file '$filename' created."
