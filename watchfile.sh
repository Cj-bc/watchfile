#/usr/local/bin/bash
# watchfile - watch file and display them & update contents
#
# ver: 0.0.1
# copyright (c) 2018 Cj-bc
# This software is released under MIT License.


watched=$1
while true; do
  new_sha256=$(openssl sha256 -r $watched | awk '{print $1}')
  if [ "$new_sha256" != "$pre_sha256" ]; then
    clear
    tput cup 1 1
    cat $watched
    pre_sha256=$new_sha256
  fi
  sleep 0.5
done

