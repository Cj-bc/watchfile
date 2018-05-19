#!/usr/local/bin/bash
# watchfile - watch file and display them & update contents
#
# ver: 0.0.1
# copyright (c) 2018 Cj-bc
# This software is released under MIT License.


watched=$1

COLOR_YELLOW=3
COLOR_GREEN=2
COLOR_BLUE=4
COLOR_WHITE=7


# get todo.txt's TODO_FILE and return file name
# @return 0 succcess
function watchfile.todofilename {
  file_path=$(awk -F "\"" '/TODO_FILE/ {print $2}' ~/.todo.cfg)
  echo ${file_path##*\/}
  return 0
}



# echo files with color for each line(if there's configuration here)
# @param <string file_name>
# @
function watchfile.colcat {

  # detect file type and chose which color to add.
  case $1 in
    *$(watchfile.todofilename) )
      # for each line, detect priority and decide color.
        while read line; do
          local words=($line)
          case ${words[0]} in
            "(A)" ) tput setaf $COLOR_YELLOW;;
            "(B)" ) tput setaf $COLOR_GREEN;;
            "(C)" ) tput setaf $COLOR_BLUE;;
            "(X)" ) tput setaf $COLOR_WHITE;;
            * ):;;
          esac
          echo $line
          tput sgr0
        done < $1
        ;;
    * ) cat $1
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

