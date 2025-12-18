#!/bin/bash
BASE_DIR="$(dirname "$(realpath "$0")")"

read -p "Would you like to clean up? (y/N): " answer
if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
    echo "Cleaning up..."
    for folder in "$BASE_DIR"/*/; do
        WORK_DIR=$(basename "$folder")
        if [ $WORK_DIR != "output" ]; then
            rm -rf "$folder"/*
        fi
    done
fi
echo "Done!"
