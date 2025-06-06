#!/usr/bin/env bash

# Downloads music from Bandcamp page.
# Required dependencies: bash, curl
#
# Might be too dependent on GNU's vesion of grep and sed.
# Haven't test this out on other systems.

# Enable strict mode
# set -euo pipefail
# IFS=$'\n\t'

# Get Bandcamp URL
if [[ -n "${1:-}" ]]; then
  url="$1"
else
  echo "Please enter Bandcamp URL." >&2
  exit 1
fi

# Download directory
if [[ -n "${2:-}" ]]; then
  downldDir="$2"
else
  downldDir="."
fi

# Create temporary directory for download files. Remove when exit.
tempDir="$(mktemp -d)"
trap 'rm -rf $tempDir' EXIT

# Variables for temporary files
json="$tempDir"/json
songTitleFile="$tempDir"/song_title
songUrlFile="$tempDir"/song_url

# Extract JSON from HTML album page. Throw error if not valid Bandcamp URL.

echo "Downloading album data..."

curl -sL "$url" \
  | grep -Po "(?<=trackinfo&quot;:\[).*?(?=\])" \
  > "$json" \
  || { echo "Error: Invalid URL!" >&2 && exit 2; }

# Extract song titles from JSON and put into file
grep -Po "(?<=title&quot;:&quot;).*?(?=&quot;)" \
  "$json" \
  > "$songTitleFile"

# Extract download URLs from JSON and put into another file
grep -Po "https://t4.bcbits.com/stream/[0-9a-z]{32}/mp3-128/[0-9]+\?p=0&amp;ts=[0-9]{10}&amp;t=[0-9a-z]{40}&amp;token=[0-9]{10}_[0-9a-z]{40}" \
  "$json" \
  > "$songUrlFile"

# Extract title and URLs from respective files and put each into array
readarray -t songTitleArray < "$songTitleFile"
readarray -t songUrlArray < "$songUrlFile"

echo "Downloading songs..."
echo

# Start counters
counterTotal=0
counterDwnld=0

# Download songs from list
for i in "${!songTitleArray[@]}"; do

  # Filename format for MP3 song files
  filename="$(printf "%02d" $((i + 1))) $(echo "${songTitleArray[i]}" | tr '<>:"/\\|?*\000' '_').mp3"

  # Check if file already exists, don't download if it does.
  if [[ -f "$downldDir"/"$filename" ]]; then

    echo "$((i + 1)) \"${songTitleArray[i]}\" already exists."

  # If song file doesn't exist, download the song.
  else

    curl -s "${songUrlArray[i]}" -o "$tempDir/$filename.part"
    mv "$tempDir/$filename.part" "$downldDir/$filename"
    ((++counterDwnld))
    echo "$((i + 1)) \"${songTitleArray[i]}\" has been downloaded..."

  fi

  # Increment counter
  ((++counterTotal))

done

# Download complete
echo
echo "$counterDwnld out of $counterTotal song(s) downloaded. Done!" 
