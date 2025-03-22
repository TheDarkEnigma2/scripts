#!/usr/bin/env bash

# Scans and plays TikTok videos with fzf

# Enable strict mode
set -euo pipefail

mpv --fs --loop=inf "$(find "${1:-.}" -iregex ".*\.\(mp4\|mov\)$" | sort -rt [ -k2 | fzf)"
