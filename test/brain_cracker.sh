#!/usr/bin/env bash

echo "The name of the script is $0."

[ -n "$1" ] && echo "The first arguement is $1."
[ -n "$3" ] && echo "The third arguement is $3."
[ -n "${10}" ] && echo "The tenth arguement is ${10}."

echo "The total number of arguements passed to this script is $#."

shift 3

[ -n "$*" ] && echo "The values of the remaining arguements are $@."

echo "The number of remaining arguements are $#."
