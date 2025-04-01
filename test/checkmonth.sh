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

# Check month
month="$(date +%B)"

case $month in
  January|March|May|July|August|October|December)
    echo "The current month is $month, which has 31 days."
  ;;
  April|June|September|November)
    echo "The current month is $month, which has 30 days."
  ;;
  February)
    if leap "$(date +%Y)"; then
      echo "The current month is $month, which has 29 days this year as it's currently a leap year."
    else
      echo "The current month is $month, which has 28 days this year as it's currently a common year."
    fi
  ;;
esac
