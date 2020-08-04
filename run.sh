#!/bin/bash

INPUT_FILES="./files/"
OUTPUT_SPLITTED="./splitted/"
OUTPUT_MERGED="./merged/"

echo "1. Split pages"
rm -rf $OUTPUT_SPLITTED*.jpg;

for FILE in $INPUT_FILES*.pdf
do
    FILENAME=$(basename $FILE .pdf);
    echo $FILENAME;
    convert -quality 100 -density 300 -resize 2480x3508 $FILE "$OUTPUT_SPLITTED${FILENAME}_%04d.jpg"
done

echo "2. Remove 'balance'"
for FILE in $OUTPUT_SPLITTED*.jpg
do
    PATTERN="*0000.jpg"
    FILENAME=$(basename $FILE .jpg);
    RECTANGLE_Y_START=633
    if [[ $FILE = $PATTERN ]];
    then
        RECTANGLE_Y_START=2256
    fi
    convert $FILE -fill white -draw "rectangle 2079,${RECTANGLE_Y_START} 2382,3180" "${OUTPUT_SPLITTED}corrected_${FILENAME}.jpg"
done

echo "3. Merge pdfs"
rm -rf $OUTPUT_MERGED*.pdf;

for FILE in $INPUT_FILES*.pdf
do
    FILENAME=$(basename $FILE .pdf);
    echo $FILENAME;
    convert "${OUTPUT_SPLITTED}corrected_${FILENAME}_*.jpg" "$OUTPUT_MERGED${FILENAME}.pdf"
done



