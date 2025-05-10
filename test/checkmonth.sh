#!/usr/bin/env sh

# Set year variable
year="$(date +%Y)"

# Function for checking if current year is a leap year.
leap() {
  if [ $(("$year" % 400)) -eq 0 ] || { [ $(("$year" % 4)) -eq 0 ] && [ $(("$year" % 100)) -ne 0 ]; }; then
    true
  else
    false
  fi
}

# Check month
month="$(date +%B)"

# String function
string() {
  echo "The current month is $1 in the year $year, which has $2 days."
}

# Print out current month and the number of days in that month.
case "$month" in
  January|March|May|July|August|October|December)
    string "$month" 31
  ;;
  April|June|September|November)
    string "$month" 30
  ;;
  February)
    if leap; then
      string "$month" 29
      echo "It is currently a leap year."
    else
      string "$month" 28
      echo "It is currently a common year."
    fi
  ;;
esac
