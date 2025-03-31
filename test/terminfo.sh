#!/usr/bin/env bash

echo "Hello, $USER!"
echo

echo "Your home directory is: $HOME"
echo "Your terminal is: $TERM"
echo "Current running services are: $(ls /var/service | xargs | sed 's/ /, /g')"
