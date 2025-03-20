#!/usr/bin/env bash

# Downloads music from Bandcamp page.
# Required dependencies: bash, curl

# Enable strict mode
set -euo pipefail

# Get Bandcamp URL
if [[ -n "${1:-}" ]]; then
  url="$1"
else
  echo "Please enter Bandcamp URL."
  exit 1
fi

# Download path
if [[ -n "${2:-}" ]]; then
  path="$2"
else
  path="."
fi

# Create temporary directory for download files. Remove when exit.
tempDir="$(mktemp -d)"
trap 'rm -rf $tempDir' EXIT

# Variables for temporary files
json="$tempDir"/json
songTitleFile="$tempDir"/song_title
songUrlFile="$tempDir"/song_url

# Extract JSON from HTML album page
curl -sL "$url" | grep -Po "(?<=trackinfo&quot;:\[).*?(?=\])" > "$json"

# Extract song titles from JSON and put into file
grep -Po "(?<=title&quot;:&quot;).*?(?=&quot;)" "$json" > "$songTitleFile"

# Extract download URLs from JSON and put into another file
grep -Eo "https://t4.bcbits.com/stream/[0-9a-z]{32}/mp3-128/[0-9]+\?p=0&amp;ts=[0-9]{10}&amp;t=[0-9a-z]{40}&amp;token=[0-9]{10}_[0-9a-z]{40}" "$json" > "$songUrlFile"

# Extract title and URLs from respective files and put each into array
readarray -t songTitleArray < "$songTitleFile"
readarray -t songUrlArray < "$songUrlFile"

echo "Downloading songs..."

# Download songs
for i in "${!songTitleArray[@]}"; do
  curl -s "${songUrlArray[i]}" -o \
    "$path/$(printf "%02d" $((i + 1))) $(echo "${songTitleArray[i]}" | tr '<>:"/\\|?*\000' '_').mp3"
  echo "$((i + 1)) \"${songTitleArray[i]}\" has been downloaded..."
done

# Download complete
echo "Done!" 
