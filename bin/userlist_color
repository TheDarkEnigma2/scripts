#!/usr/bin/env bash

awk -F':' '
  BEGIN{
    print "\033[1;91mUSER:PASS:UID:GID:DESCRIPTION:HOMEDIR:SHELL\033[0m"
    OFS=FS
  }
  {
    $2 = "\033[0;90m" $2 "\033[0m"
    $4 = "\033[0;92m" $4 "\033[0m"
    $5 = "\033[0;93m" $5 "\033[0m"
    $6 = "\033[0;95m" $6 "\033[0m"
    $7 = "\033[0;96m" $7 "\033[0m"
    print
  }
' /etc/passwd | column -ts:
