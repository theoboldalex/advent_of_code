#!/usr/bin/env bash

awk -F':' '!/([2-9][0-9]|1[3-9]) red|([2-9][0-9]|1[4-9]) green|([2-9][0-9]|1[5-9]) blue/ {gsub(/[^0-9]/, "", $1); sumGames+=$1} END{print sumGames}' < input


