#!/usr/bin/env bash

# This script will test if we're in a leap year or not.

if [ -n "$1" ]; then
  year="$1"
else
  year="$(date +%Y)"
fi

if (( ("$year" % 400) == "0" )) || (( ("$year" % 4 == "0") && ("$year" % 100 != "0") )); then
  echo "This is a leap year. February has 28 days."
else
  echo "This is not a leap year. February has 29 days."
fi
