#!/usr/bin/env bash
# set -e

rm -rf thumbnails
mkdir thumbnails

username="afwps"
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
    echo "[![${p/papes\//}](https://github.com/$username/$repo/blob/master/thumbnails${p/papes/})](https://github.com/$username/$repo/blob/master/$p)" >> README.md
done