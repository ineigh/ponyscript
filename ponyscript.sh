#!/bin/bash
BASE_DIR="$(dirname "$(realpath "$0")")"
LOUDER="volume=3dB" # You can edit this value to make your files louder or quieter, I've found 3dB to be the sweet spot for me
FASTER="atempo=1.1" # Likewise, if you'd like your final laps to play faster or slower, you can edit this value
errors=0
successes=0

for folder in "$BASE_DIR"/*/; do
    WORK_DIR=$(basename "$folder")
    if [ $WORK_DIR != "output" ]; then
        file_count=$(find "$folder" -maxdepth 1 -type f | wc -l)
        if [ $file_count == 1 ]; then
            file=$(find "$folder" -maxdepth 1 -type f)
            ext="${file##*.}"
            tmp="${file}.tmp.${ext}"
            ffmpeg -y -i "$file" -filter:a "$LOUDER" "$tmp"
            mv "$tmp" "$file"
            if [[ "$file" != *.wav ]]; then
                ffmpeg -loglevel quiet -i "$file" "${folder}onetwo.wav"
                if [ $? -eq 0 ]; then
                    rm "$file"
                    file=$(find "$folder" -maxdepth 1 -type f)
                else
                    echo "There was an error converting the file in $folder to WAV"
                    ((errors++))
                    continue
                fi 
            else
                if [ "$file" != "${folder}onetwo.wav" ]; then
                    mv "$file" "${folder}onetwo.wav"
                fi
            fi 
            ffmpeg -loglevel quiet -i "$file" -filter:a "$FASTER" ""$folder"final.wav"
            if [ $? -eq 0 ]; then
                case "$WORK_DIR" in
                    tf|wgm|ddr|mh)
                        ffmpeg -loglevel quiet -i ""$folder"onetwo.wav" -ac 1 -filter_complex "[0][0][0][0]amerge=inputs=4" -ac 1 ""$folder"onetwoMULTI.wav"
                        ffmpeg -loglevel quiet -i ""$folder"final.wav" -ac 1 -filter_complex "[0][0][0][0]amerge=inputs=4" -ac 1 ""$folder"finalMULTI.wav"
                        rm ""$folder"onetwo.wav" ""$folder"final.wav"
                        mv ""$folder"onetwoMULTI.wav" ""$folder"onetwo.wav"
                        mv ""$folder"finalMULTI.wav" ""$folder"final.wav"
                    ;;
                    bcw|kc)
                        ffmpeg -loglevel quiet -i ""$folder"onetwo.wav" -ac 1 -filter_complex "[0][0][0][0][0][0][0][0]amerge=inputs=8" -ac 1 ""$folder"onetwoMULTI.wav"
                        ffmpeg -loglevel quiet -i ""$folder"final.wav" -ac 1 -filter_complex "[0][0][0][0][0][0][0][0]amerge=inputs=8" -ac 1 ""$folder"finalMULTI.wav"
                        rm ""$folder"onetwo.wav" ""$folder"final.wav"
                        mv ""$folder"onetwoMULTI.wav" ""$folder"onetwo.wav"
                        mv ""$folder"finalMULTI.wav" ""$folder"final.wav"
                    ;;
                esac
                lap=$(jq -r ".\"$WORK_DIR\".\"1\"" ""$BASE_DIR"/names.json")
                flap=$(jq -r ".\"$WORK_DIR\".\"2\"" ""$BASE_DIR"/names.json")
                brstm_converter ""$folder"onetwo.wav" -o ""$BASE_DIR"/output/"$lap".brstm"
                brstm_converter ""$folder"final.wav" -o ""$BASE_DIR"/output/"$flap".brstm"
                ((successes++))
            else
                ((errors++))
                continue
            fi 
        fi 
    fi 
done

cat pony.txt
echo "Converted: $successes"
echo "Errors: $errors"
read -p "We're all set! Would you like to clean up? (y/N): " answer
if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
    echo "Cleaning up..."
    for folder in "$BASE_DIR"/*/; do
        WORK_DIR=$(basename "$folder")
        if [ $WORK_DIR != "output" ]; then
            rm -rf "$folder"/*
        fi
    done
    echo "Done!"
fi
echo "Happy racing!"
