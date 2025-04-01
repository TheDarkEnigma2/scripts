#!/usr/bin/env bash

# This script prints information about current month

# Function which checks if current year is a leap year.
leap() {
  if [ "$(($1 % 400))" -eq "0" ] || { [ "$(($1 % 4))" -eq "0" ] && [ "$(($1 % 100))" -ne "0" ]; }; then
    true
  else
    false
  fi
}

# Month variable
if [ -z "$1" ]; then
  month="$(date +%m)"
else
  month="$(printf "%02d" "$1" 2> /dev/null)"
fi

# Year variable
if [ -z "$2" ]; then
  year="$(date +%Y)"
elif [ "$2" -eq "$2" ] 2> /dev/null; then
  year="$2"
else
  echo "Please enter a valid year." && exit 255
fi

case $month in
  01)
    echo "The current month is January, which has 31 days."
  ;;
  02)
    if leap "$year"; then
      echo "The current month is February and it's a leap year, which has 29 days."
    else
      echo "The current month is February and it's a common year, which has 28 days."
    fi
  ;;
  03)
    echo "The current month is March, which has 31 days."
  ;;
  04)
    echo "The current month is April, which has 30 days."
  ;;
  05)
    echo "The current month is May, which has 31 days."
  ;;
  06)
    echo "The current month is June, which has 30 days."
  ;;
  07)
    echo "The current month is July, which has 31 days."
  ;;
  08)
    echo "The current month is August, which has 31 days."
  ;;
  09)
    echo "The current month is September, which has 30 days."
  ;;
  10)
    echo "The current month is October, which has 31 days."
  ;;
  11)
    echo "The current month is November, which has 30 days."
  ;;
  12)
    echo "The current month is December, which has 31 days."
  ;;
  *)
    echo "Please enter valid month." && exit 255
  ;;
esac
