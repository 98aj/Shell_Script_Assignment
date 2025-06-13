\
#!/bin/bash

file_name=./todo.txt

add_task () {
 read -p "Enter your task: " task
 echo "$task" >> $file_name
 echo "Task added to todo..."
 view_task
}

view_task () {
 if [[ -f "$file_name" && -s "$file_name" ]]; then
  cat "$file_name"
 else
  echo "No Task created yet. please add task."
 fi
}

remove_task () {
 if [[ -f "$file_name" ]]; then
  > $file_name
 else
  echo "Nothing to remove."
 fi
}



while true; do
 echo "......Todo Menu......"
 echo "1. Add Task  2. View Task  3. Remove Task  4. Exit"
 read -p "Please select option: " user_option

 if [[ "$user_option" == "1" ]]; then
  add_task
 elif [[ "$user_option" == "2" ]]; then
  view_task
 elif [[ "$user_option" == "3" ]]; then
  remove_task
 elif [[ "$user_option" == "4" ]]; then
  echo "Exiting..."
  break
 else
  echo "Please select option from above."
 fi
done
