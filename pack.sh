#!/bin/sh

ASSET_FOLDER="$1"
EXCLUDE="$2"
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

read -p "Password: " password

root="$(pwd)"
for dir in $ASSET_FOLDER/*; do
    dir="${dir%/}"
    if [ -d "$dir" ]; then
        echo "Packing files in $dir"

        name=$(basename "$dir")
        out_file="$OUTPUT_FOLDER/$name.7z"
        if [ -f "$out_file" ]; then
            echo "Removing existing file $out_file"
            rm $out_file
        fi

        cd $dir

        echo "Zipping to $out_file"
        if [ -z "$EXCLUDE" ]; then
            7z a "$root/$out_file" * -p"$password" -mhe=on
        else
            7z a "$root/$out_file" * -p"$password" -mhe=on -xr!$EXCLUDE
        fi

        cd -
    fi
done