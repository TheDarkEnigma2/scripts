#!/usr/bin/env bash

# Scans and plays TikTok videos with fzf

# Enable strict mode
set -euo pipefail

# Regex
regex=".*\.\(png\|jpg\)$"

# Scan function
scan(){
  find "$1" -type f -iregex "$regex" \
  | fzf --preview 'cat {} | kitty icat --clear --transfer-mode=memory --stdin=yes --place=${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}@0x0'
}

# Play video
mpv --fs --loop=inf "$(scan "${1:-.}")"
