#!/usr/bin/env sh

# Check month
if [ -z "$1" ]; then
  month="$(date +%B)"
elif [ "$1" -eq "$1" ] 2> /dev/null; then
  monthNum="$(printf "%02d" "$1")"

  case "$monthNum" in
    01) month="January" ;;
    02) month="February" ;;
    03) month="March" ;;
    04) month="April" ;;
    05) month="May" ;;
    06) month="June" ;;
    07) month="July" ;;
    08) month="August" ;;
    09) month="September" ;;
    10) month="October" ;;
    11) month="November" ;;
    12) month="December" ;;
  esac
else
  month="$1"
fi

# Set year variable
if [ -z "$2" ]; then
  year="$(date +%Y)"
elif [ "$2" -eq "$2" ] 2> /dev/null; then
  year="$2"
else
  echo "Please enter valid year."
  exit 254
fi

# Function for checking if current year is a leap year.
leap() {
  if [ $(($year % 400)) -eq 0 ] || { [ $(($year % 4)) -eq 0 ] && [ $(($year % 100)) -ne 0 ]; }; then
    true
  else
    false
  fi
}

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
  *)
    echo "Please enter a valid month, either as a number or full name of the month."
    exit 255
  ;;
esac
