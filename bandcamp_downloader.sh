#!/usr/bin/env bash

# Downloads music from Bandcamp page.
# Required dependencies: bash, curl, jq

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

# Create download list file. Remove when exit.
dwnldList="$(mktemp)"
trap 'rm -f $dwnldList' EXIT

# Extract song URL and title into download list file
curl -sL "$url" \
  | grep -Po "(?<=data-tralbum=\").*?(?=\")" \
  | sed 's/&quot;/\"/g' \
  | jq -r '.trackinfo[] | [(.file."mp3-128"),(.title)] | @tsv' \
  > "$dwnldList"

# Separate URL and title lists from download file and put each into arrays 
readarray -t songUrl < <(cut -f1 "$dwnldList")
readarray -t songTitle < <(cut -f2- "$dwnldList")

echo "Downloading songs..."

# Download songs
for i in "${!songUrl[@]}"; do
  curl -s "${songUrl[i]}" -o \
    "$path/$(printf "%02d" $((i + 1))) $(echo "${songTitle[i]}" | tr '<>:"/\\|?*\000' '_').mp3"
  echo "$((i + 1)) \"${songTitle[i]}\" has been downloaded..."
done

# Download complete
echo "Done!" 
