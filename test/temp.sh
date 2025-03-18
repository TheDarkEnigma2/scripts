#!/usr/bin/env bash

# List temperatures in increments of 10 degrees celsius.

for i in {0..100..10}; do
  printf "%6.2f degrees celsius\t%6.2f degrees fahrenheit\n" \
    "$i" "$((((i * 9) / 5) + 32))"
done
