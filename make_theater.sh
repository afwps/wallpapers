#!usr/bin/env bash
# set -e

# deletes thumbnails folder if it already exists
rm -rf thumbnails
# creates a new one
mkdir thumbnails

user="afwps"
repo="theatrum"

cat HEADER.md > README.md
echo "" >> README.md

n=$(ls papes/ | wc -l)
i=0

for p in papes/*
do
    ((i++))
    printf '%4d/%d: %s\n' "$i" "$n" "${p/papes\//}"

    # creates thumbnails
    convert -resize 200x "$p" "${p/papes/thumbnails}"
    # makes entries in README
    echo "[![${p/papes\//}](https://raw.githubusercontent.com/$username/$repo/master/thumbnails${p/papes/})](https://raw.githubusercontent.com/$username/$repo/master/$p)" >> README.md
done