#!/usr/local/bin/bash
# watchfile - watch file and display them & update contents
#
# ver: 0.0.1
# copyright (c) 2018 Cj-bc
# This software is released under MIT License.


watched=$1

COLOR_YELLOW='\\033[1;33m'
COLOR_DEFAULT='\\033[0m'

# echo files with color scheme (if there's configuration here)
# @param <string file_name>
# @
function watchfile.colcat {
  case $1 in
    "todo/todo.txt" )
      while read line; do
        local echoed=($line)
        # color scheme for priority
        case ${echoed[0]} in
          "(A)" ) tput setaf 3;;
          "(B)" ) tput setaf 2;;
          * ):;;
        esac
        echo $line
        tput sgr0
      done < $1
      ;;
  esac
}

while true; do
  new_sha256=$(openssl sha256 -r $watched | awk '{print $1}')
  if [ "$new_sha256" != "$pre_sha256" ]; then
    clear
    tput cup 1 1
    watchfile.colcat $watched
    echo "---"; echo TODO
    pre_sha256=$new_sha256
  fi
  sleep 0.5
done

