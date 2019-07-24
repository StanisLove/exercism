#!/usr/bin/env bash

main() {
  (( $# != 2 )) && raise 'Usage: hamming.sh <string1> <string2>'
  (( ${#1} != ${#2} )) && raise 'left and right strands must be of equal length'

  declare -i result=0
  local -i result

  for ((i = 0; i < ${#1}; i++)); do
    [[ ${1:$i:1} != ${2:$i:1} ]] && result+=1
  done

  echo "$result"
}

raise() {
  echo >&2 "$1"
  exit 1
}

main "$@"
