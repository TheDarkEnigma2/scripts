#!/usr/bin/env bash

# Hello function.
hello() {
  echo "Hello, $*!"
}

# If script is run with name as arguement, greet user.
if [[ -n $* ]]; then
  hello "$*"

# If no arguement is given, ask user for their name.
else
  while read -rp "What is your name? " name; do

    # Greet user and exit.
    if [[ -n $name ]]; then
      hello "$name"; exit 0

    # If response is empty, prompt user again.
    else
      echo "You didn't tell me your name! Let's try this again."
    fi
  
  done
fi
