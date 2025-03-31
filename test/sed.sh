#!/usr/bin/env sh

if [ -z "$1" ]; then
  echo "Usage: $0 <some_file>, or <command> | $0"
  exit 255
fi

file="$1"

sed '1,3d' "$file"
echo "---"
sed -n '/an/p' "$file"
