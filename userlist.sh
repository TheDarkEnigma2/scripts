#!/usr/bin/env sh

(echo USER:PASS:UID:GID:DESCRIPTION:HOMEDIR:SHELL && cat /etc/passwd) | column -ts:
