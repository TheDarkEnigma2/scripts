#!/usr/bin/awk -f

BEGIN { FS=":" }
{ print $1 "\t" $5 }
