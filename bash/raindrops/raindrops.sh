#!/usr/bin/env bash

main() {
  (( $1 % 3 == 0 )) && str="Pling"
  (( $1 % 5 == 0 )) && str+="Plang"
  (( $1 % 7 == 0 )) && str+="Plong"
  [[ -z $str ]] && str=$1

  echo $str
}

main "$@"
