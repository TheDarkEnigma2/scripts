#!/usr/bin/env sh

# "FizzBuzz" program in POSIX shell

# Start counter at 1
i=1

# Loop upto 100
while [ $i -le 100 ]; do

  # Add comma and space before any number greater than the starting number.
  [ $i -ne 1 ] && printf ", "

  # Print "FizzBuzz for numbers divisible by 15
  if [ `expr $i % 3` -eq 0 ] && [ `expr $i % 5` -eq 0 ]; then
    printf "FizzBuzz"

  # Print "Fizz" for numbers divisible by 3
  elif [ `expr $i % 3` -eq 0 ]; then
    printf "Fizz"

  # Print "Buzz" for numbers divisible by 5
  elif [ `expr $i % 5` -eq 0 ]; then
    printf "Buzz"

  # Print number for anything not divisible by neither 3 nor 5.
  else
    printf "%d" $i
  fi

  # Increase counter by one
  i=`expr $i + 1`

done

# End with newline
echo
