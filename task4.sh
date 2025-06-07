#!/bin/bash

read user_folder_path

echo "$user_folder_path"

if [ ! -d "$user_folder_path" ]; then
  echo "Folder does not exist. Go to folder you want to take backup and run command 'pwd' to see path of directory"
else
  echo "Folder exist"
  current_date=$(date +%Y-%m-%d)
  backup_filename="backup_${current_date}.tar.gz"
  tar -czf "$backup_filename" "$user_folder_path"
  echo "Backup Completed and save to backup_$current_date.tar.gz"
fi
