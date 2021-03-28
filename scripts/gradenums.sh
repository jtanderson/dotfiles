#!/usr/bin/env bash

set -Eeuo pipefail
trap cleanup SIGINT SIGTERM ERR EXIT

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

# Inspiration: echo {1..9}. | sed "s/ /\n/g" | sed -E "s/([89])./\1a.\n\1b./g"

usage() {
  cat <<EOF
Usage: $(basename "${BASH_SOURCE[0]}") [-h] [-v] total [subquestions1] [subquestions2] ...

This program prints a list of numbers in a format that is amenable to copy/pasting into
a web form comment block or email.

Available options:

-h, --help      Print this help and exit
-v, --verbose   Print script debug info
EOF
exit
}

cleanup() {
  trap - SIGINT SIGTERM ERR EXIT
  # script cleanup here
}

setup_colors() {
  if [[ -t 2 ]] && [[ -z "${NO_COLOR-}" ]] && [[ "${TERM-}" != "dumb" ]]; then
    NOFORMAT='\033[0m' RED='\033[0;31m' GREEN='\033[0;32m' ORANGE='\033[0;33m' BLUE='\033[0;34m' PURPLE='\033[0;35m' CYAN='\033[0;36m' YELLOW='\033[1;33m'
  else
    NOFORMAT='' RED='' GREEN='' ORANGE='' BLUE='' PURPLE='' CYAN='' YELLOW=''
  fi
}

msg() {
  echo >&2 -e "${1-}"
}

die() {
  local msg=$1
  local code=${2-1} # default exit status 1
  msg "$msg"
  exit "$code"
}

parse_params() {
  # default values of variables set from params
  flag=0

  while :; do
    case "${1-}" in
      -h | --help) usage ;;
      -v | --verbose) set -x ;;
      --no-color) NO_COLOR=1 ;;
      -?*) die "Unknown option: $1" ;;
      *) break ;;
    esac
    shift
  done

  args=("$@")

  # check required params and arguments
  [[ ${#args[@]} -eq 0 ]] && die "Missing script arguments"

  return 0
}

parse_params "$@"
setup_colors

# script logic here

# msg "${RED}Read parameters:${NOFORMAT}"
# msg "- arguments: ${args[*]-}"

total=${args[0]}

basecmd="echo {1..$total}. | sed \"s/ /\n/g\""
cmd=$basecmd

for  i in "${@:2}"; do
  num="$(echo $i | grep -o -E "[0-9]+")"
  parts="$(echo $i | grep -o -E "[a-zA-Z]+")"
  
  # echo -n "Number $num has parts: "

  cmd="${cmd} | sed -E \"s/^$num.$/"
  for (( j=0; j<${#parts}; j++ )); do
    # echo -n "${i:$j:1}"
    part="${parts:$j:1}"
    cmd="${cmd}${num}${part}."
    if (( $j < ${#parts} - 1 )); then
      cmd="${cmd}\n"
    fi
  done
  cmd="${cmd}/g\""
done

# echo $cmd

echo $cmd | bash

