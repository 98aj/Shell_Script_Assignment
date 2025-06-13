#!/bin/bash

read -p "Please provide text file path: " text_file_path

if [[ ! -f "$text_file_path" ]]; then
 echo "File does not exist, please provide valid path."
 exit 1
fi
#while ICS=' ' read -r input; do
 #word_count=$(wc -w )
# echo "$input"
#done < $text_file_path

longest_word=""
for word in $(cat "$text_file_path"); do
 word=${word//[.,!?;:\"()]/}

 word_len=${#word}
 longest_len=${#longest_word}
 
 if [[ $word_len -gt $longest_len ]]; then
  longest_word=$word
 fi
done

word_count=$(wc -w < "$text_file_path")
line_count=$(wc -l < "$text_file_path")
char_count=$(wc -c < "$text_file_path")
echo "$word_count words exist in file."
echo "$line_count lines exist in file."
echo "$char_count characters exist in file."
echo "$longest_word is the longest word in file"
