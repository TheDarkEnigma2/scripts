#/usr/bin/env bash

# These lines will print a message if the noclobber option is set:

[ -o noclobber ] && "Your files are protected against accidental overwriting using redirection."
