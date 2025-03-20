#!/usr/bin/env sh

# Greeting program, using "case" statements.

# Question function.
ask() {
  printf "What is your name? "
}

# Ask user for their name.
ask

# Get user's name and greet them.
# Repeat question if response is empty.
while read -r name; do
  case "$name" in
    "")
      echo "You didn't tell me your name! Let's try this again."
      ask
      ;;
    *)
      echo "Hello, $name!"
      exit
      ;;
  esac
done
