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