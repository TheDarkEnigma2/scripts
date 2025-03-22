#!/usr/bin/env bash

# "FizzBuzz" program in Bash

# Start loop from 1 to 100
for i in {1..100}; do
  [[ $i -ne 1 ]] && printf ", "

  if [[ $((i % 3)) -eq 0 ]] && [[ $((i % 5)) -eq 0 ]]; then
    printf "FizzBuzz"
  elif [[ $((i % 3)) -eq 0 ]]; then
    printf "Fizz"
  elif [[ $((i % 5)) -eq 0 ]]; then
    printf "Buzz"
  else
    printf "%d" "$i"
  fi
done

echo
