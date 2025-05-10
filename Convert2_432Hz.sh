#!/bin/bash
# Batch convert all .mp3 files in the current directory to 432Hz with ffmpeg

# Options
suffix="false" # Append the -432Hz suffix or not

oldIFS=$IFS
IFS=$'\n'
set -f # Deal with blanks and special characters in file names of the file command and in for loop

found=($(find . -name "*.mp3")) # Find the files in the current directory

IFS=$oldIFS
set +f

cpuCount=$(nproc --all)
started=0

# Wait for all remaining sub shells to complete, first argument is the counter of max subshells
wait4Completion() {
  if [ "$1" -gt 0 ]; then
    ((started++)) # Increase variable
  fi

  if [ $started -gt "$1" ]; then
    wait;
    started=0;
  fi
}

for file in "${found[@]}"; do # Iterate the found files
  (mv "$file" "$file.tmp"; ffmpeg -loglevel 8 -i "$file.tmp" -af "asetrate=48000*432/440,aresample=48000,atempo=440/432" "$file"; rm "$file.tmp"; echo "Pitched $file") &
  wait4Completion $cpuCount
done

wait4Completion 0
