#!/usr/bin/env bash

# Downloads music from Bandcamp page.
# Required dependencies: bash, curl, jq

# Enable strict mode
set -euo pipefail

# Get Bandcamp URL
if [[ -n "${1:-}" ]]; then
  url="$1"
else
  echo "Please enter Bandcamp URL."; exit 1
fi

# Download path
if [[ -n "${2:-}" ]]; then
  path="$2"
else
  path="."
fi

# Create download list file. Remove when exit.
downloadFile="$(mktemp)"; trap 'rm -f $downloadFile' EXIT

# Extract song URL and title into download list file
curl -sL "$url" \
  | grep -Po "(?<=data-tralbum=\").*?(?=\")" \
  | sed 's/&quot;/\"/g' \
  | jq -r '.trackinfo[] | [(.file."mp3-128"),(.title)] | @tsv' \
  > "$downloadFile"

# Separate URL and title lists from download file and put each into arrays 
readarray -t songurl < <(cut -f1 "$downloadFile")
readarray -t songtitle < <(cut -f2- "$downloadFile")

echo "Downloading songs..."

# Download songs
for i in "${!songurl[@]}"; do
  curl -s "${songurl[i]}" -o \
    "$path/$(printf "%02d" $((i + 1))) $(echo "${songtitle[i]}" | tr '<>:"/\\|?*\000' '_').mp3"
  echo "$((i + 1)) \"${songtitle[i]}\" has been downloaded..."
done

# Download complete
echo "Done!" 
