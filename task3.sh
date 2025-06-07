#!/bin/bash

user_file="user_list.txt"
credential="credentials.txt"

echo "Reading $user_file"

while read -r username;do
  if [ -z "$username" ];then
    continue
  else
    echo "User creation started for $username"
    useradd "$username"
    password=$(tr -dc A-Za-z0-9_ < /dev/urandom | head -c 8)
    echo "$username:$password" | chpasswd
    echo "$username:$password" >> $credential
  fi
done < $user_file
echo "All user created and password save to $credential"
