#!/usr/bin/env bash

set -o errexit

main() {
  echo "One for ${1:-you}, one for me."
}

main "$@"
