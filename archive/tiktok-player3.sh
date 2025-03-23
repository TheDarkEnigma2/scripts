#!/usr/bin/env bash

# Scans and plays TikTok videos with fzf

# Enable strict mode
set -euo pipefail

# Regex
regex=".*\.\(mp4\|mov\)$"

# Scan function
scan(){
  find "$1" -type f -iregex "$regex" \
  | fzf --preview 'ffmpeg -i {} -ss 00:00:01.00 -vframes 1 -f image2 - 2> /dev/null | kitty icat --clear --transfer-mode=memory --stdin=no --place=${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}@0x0'
}

# Play video
mpv --fs --loop=inf "$(scan "${1:-.}")"
