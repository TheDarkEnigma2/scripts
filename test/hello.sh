#!/usr/bin/env bash

# Asks user for their name.
while read -rp "What is your name? " name; do

  # Greet user and exit.
  if [[ -n $name ]]; then
    echo "Hello, $name!"; exit 0
  
  # If response is empty, prompt user again.
  else
    echo "You didn't tell me your name! Let's try this again."
  fi

done
