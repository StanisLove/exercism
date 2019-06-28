#!/usr/bin/env bash

main() {
  if (( $# != 1 )); then
    echo >&2 "Usage: ./error_handling <greetee>"
    exit 1
  fi

  echo "Hello, $1"
}

main "$@"
