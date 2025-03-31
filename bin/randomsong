#!/usr/bin/env bash

# Simply picks a single song from directory at random.

# Audio formats
formats=(
  "aac"
  "aif"
  "aifc"
  "aiff"
  "alac"
  "ape"
  "dsf"
  "flac"
  "m4a"
  "m4b"
  "m4v"
  "mka"
  "mkv"
  "mp3"
  "mp4"
  "mpc"
  "mpeg"
  "ofr"
  "ofs"
  "ogg"
  "opus"
  "spx"
  "tak"
  "tta"
  "wav"
  "webm"
  "wma"
  "wv"
)

# Regex pattern
regex(){
  echo ".*\.\($(echo "${formats[*]}" | sed 's/ /\\|/g')\)$"
}

# Pick song at random and play with FFplay
ffplay -i "$(find "${1:-.}" -maxdepth 1 -type f -iregex "$(regex)" | shuf -n1)" \
  -nodisp -hide_banner -autoexit
