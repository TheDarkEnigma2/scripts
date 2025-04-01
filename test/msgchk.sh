#!/usr/bin/env bash

msgfile="/var/log/messages"

echo "This script checks the existence of the messages file."
echo "Checking..."

[ -f "$msgfile" ] && echo "$msgfile exists."

echo
echo "...done!"
