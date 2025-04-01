#!/bin/bash

# This script does a very simple test for checking disk space.

space="$(df -h | awk '{print $5}' | grep % | grep -v Use | sort -n | tail -1 | cut -d "%" -f1 -)"

case "$space" in
  [1-6]*)
    message="All is quiet."
  ;;
  [7-8]*)
    message="Start thinking about cleaning out some stuff. There is a partition that is ${space}% full!"
  ;;
  9[0-8])
    message="Better hurry with that new disk... One partition is ${space}% full!"
  ;;
  99)
    message="I'm drowning here! There's a partition at ${space}%!!!"
  ;;
  *)
    message="I seem to be running with a non-existent ammount of disk space..."
  ;;
esac

echo "$message"
