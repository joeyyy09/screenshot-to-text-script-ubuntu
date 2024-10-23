#!/bin/bash

# Set your screenshot directory (modify as per your setup)
WATCH_DIR=~/Pictures/Screenshots

# Ensure the directory exists
mkdir -p "$WATCH_DIR"

# Monitor the directory for newly created PNG files (screenshots)
inotifywait -m -e create --format "%f" "$WATCH_DIR" | while read NEW_FILE
do
    # Check if the new file is a PNG
    if [[ "$NEW_FILE" == *.png ]]; then
        # Remove the file extension from the filename
        FILE_NAME=$(basename "$NEW_FILE" .png)

        # Convert the screenshot to text using Tesseract OCR
        tesseract "$WATCH_DIR/$NEW_FILE" "$WATCH_DIR/$FILE_NAME"_output

        echo "Converted $NEW_FILE to text in $WATCH_DIR/${FILE_NAME}_output.txt"
    fi
done
