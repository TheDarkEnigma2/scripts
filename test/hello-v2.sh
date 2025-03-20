#!/usr/bin/env sh

# Greeting program, using "if/else" statements.

# Question function.
ask() {
  printf "What is your name? "
}

# Hello function.
hello () {
  echo "Hello, $1!"
}

# If name is given as arguement, greet user.
[ -n "$1" ] && hello "$1" && exit

# If script run without arguement, ask user for their name.
ask

# Get user's name and greet them.
# Repeat question if response is empty.
while read -r name; do
  if [ -n "$name" ]; then
    hello "$name"
    exit
  else
    echo "You didn't tell me your name! Let's try this again."
    ask
  fi
done
