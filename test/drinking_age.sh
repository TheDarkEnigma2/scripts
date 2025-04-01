#!/usr/bin/env bash

printf "How old are you? "

read -r age

if [ "$age" -ge 16 ]; then
  echo "You are $age years old. You are legally old enough to drink alcohol!"
  echo
  echo "Statistically, a person your age would have drunk $(( (($age - 15)) * 100)) liters of alcohol in their lifetime."
else
  echo "You are too young to drink! You will have to wait $((16 - $age)) year(s) until you are legally old enough to drink alcohol"
fi
