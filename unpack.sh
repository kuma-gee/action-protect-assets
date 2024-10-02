#!/bin/bash

ASSET_FOLDER="$1"
password="$2"
OUTPUT_FOLDER="$3"

if [ -z "$ASSET_FOLDER" ] || [ ! -d $ASSET_FOLDER ]; then
    echo "Invalid asset folder provided: $ASSET_FOLDER"
    exit 1
fi

if [ -z "$OUTPUT_FOLDER" ]; then
    OUTPUT_FOLDER=$ASSET_FOLDER
fi

if [ ! -d $OUTPUT_FOLDER ]; then
    mkdir -p $OUTPUT_FOLDER
fi

ASSET_FOLDER="${ASSET_FOLDER%/}"
OUTPUT_FOLDER="${OUTPUT_FOLDER%/}"

# read -s -p "Password: " password

for file in $ASSET_FOLDER/*; do
    if [[ -f "$file" ]] && [[ "$file" == *.zip ]]; then
        echo "Unpacking files in $file"

        filename=$(basename "$file")
        filename="${filename%.*}"
        unzip -o -P $password -d "$OUTPUT_FOLDER/$filename" $file
    fi
done