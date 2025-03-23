#!/usr/bin/env bash

# Scans and plays TikTok videos with fzf

# Enable strict mode
set -euo pipefail

# Regex
regex=".*\.\(mp4\|mov\)$"

# Scan function
scan(){
  find "$1" -type f -iregex "$regex" \
  | fzf --preview 'ffprobe -hide_banner {}'
}

# Play video
mpv --fs --loop=inf "$(scan "${1:-.}")"
