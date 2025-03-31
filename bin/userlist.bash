#!/usr/bin/env bash
HC='\e[1;91m'
NC='\e[0m'

column -ts: <(echo -e "${HC}USER:PASS:UID:GID:DESCRIPTION:HOMEDIR:SHELL${NC}") /etc/passwd
