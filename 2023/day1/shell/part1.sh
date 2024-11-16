#!/usr/bin/env bash

sed 's/[^0-9]//g; s/^\(.\).*\(.\)$/\1\2/g; s/^\(.\)$/\1\1/g' < input | awk '{sum+=$1} END {print sum}'



