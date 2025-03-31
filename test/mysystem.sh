#!/usr/bin/env bash

# Script for printing out system info.

# Clear screen
clear

# Print information
echo "Hello, $USER"
echo

echo "Today's date is $(date), this week is $(date +%V)."
echo

echo "These users are currently connected:"
w | cut -d " " -f 1 - | grep -v USER | sort -u
echo

echo "This is $(uname -s) running on a $(uname -m) processor."
echo

echo "This is the uptime information:"
uptime
echo

# Print goodbye
echo "That's all folks!"
