#!/bin/bash

# Todo skip newlines in file
while IFS='' read -r line || [[ -n "$line" ]]; do
    URL=$line
    BASE=$(basename ${URL})
    FILE=$(printf '%b' ${BASE//%/\\x})
    wget ${URL}
    libreoffice --headless --invisible --convert-to pdf $FILE &>/dev/null  #--outdir output_dir
done < "$1"

mkdir -p ./downloaded_slides
mv *.pdf ./downloaded_slides
