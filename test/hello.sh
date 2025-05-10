#!/usr/bin/env sh

# Asks user for their name and greets them.

# "Ask" function
ask() {
  printf "What is your name? "
}

# Prompt user for their name.
ask

# Read input as variable "name" and start loop.
while read -r name; do

  # If the user gives no response, ask for their name again.
  if [ -z "$name" ]; then
    echo "You didn't tell me your name! Let's try this again."
    ask

  # If user provides name, greet them with their name and successfully exit
  # program.
  else
    echo "Hello, $name!"
    exit
  fi

done
