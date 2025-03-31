#!/usr/bin/env sh

file="$1" # save the first arguement as "$file"
shift # drop the first arguement from "$@"
echo "$@" > "$file" # write the remaining arguements to "$file"
