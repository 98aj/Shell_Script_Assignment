#!/bin/bash

destination="/home/abhi/backup"
dir="/home/abhi/linuxTutorial"

echo "Creting direcory..."
mkdir "$destination"
echo "Folder created at $destination ..."

backupFile(){
echo "Searching for .txt files in $dir ..."
for file in "$dir"/*.txt; do
  local filename=$(basename "$file")
  local timestamp=$(date +"%Y%m%d_%H%M%S")
  cp "$file" "$destination/${filename%.txt}_$timestamp.txt"
  echo "$filename"
done
echo "Backup completed..."
}

backupFile
