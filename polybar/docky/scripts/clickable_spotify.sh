#!/usr/bin/env bash

MYPID="ps aux | grep 'spotify --uri' |grep -v grep  |cut -d ' ' -f 5 | head -n 1"
# echo eval $MYPID
wmctrl -a $(wmctrl -l -p | grep $(eval $MYPID) | cut -d " " -f 6)
