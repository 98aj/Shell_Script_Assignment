#!/bin/bash

package_list_file="./package.txt"
log_file="./package_intall_log.txt"

echo "Package installation started at $(date)" >> "$log_file"

if which yum; then
 install_command="sudo yum install -y"
 echo "Package manager is yum"
elif which apt-get; then
 install_command="sudo apt-get install -y"
 echo "Package manager is apt"
fi


while read -r package; do
 if [[ ! -z $package ]]; then
 echo "Installing $package ..." 
 echo "Installing $package" >> "$log_file" 2>&1
  $install_command "$package" >> "$log_file"
  
  if [[ "$?" -eq 0 ]]; then
   echo "Installation completed..."
   echo "Installing $package : Success" >> "$log_file"
  else
   echo "Installation faliled please check log file for more details."
   echo "Installing $package : Failed" >> "$log_file"
  fi

 else
  continue
 fi
done < "$package_list_file"

