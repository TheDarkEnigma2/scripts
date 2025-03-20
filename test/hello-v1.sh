#!/usr/bin/env sh

# Greeting program, using "if/else" statements.

# Question function.
ask() {
  printf "What is your name? "
}

# Ask user for their name.
ask

# Get user's name and greet them.
# Repeat question if response is empty.
while read -r name; do
  if [ -n "$name" ]; then
    echo "Hello, $name!"
    exit
  else
    echo "You didn't tell me your name! Let's try this again."
    ask
  fi
done
