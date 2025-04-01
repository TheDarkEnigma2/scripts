#!/usr/bin/env sh

[ -z "$1" ] && echo "Usage: $0 <file>, or <cmd> | $0" && exit 255

file="$1"

sed '1,3d' "$file"
echo "---"
sed -n '/an/p' "$file"
