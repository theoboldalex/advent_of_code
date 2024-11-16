#!/usr/bin/env bash

sed 's/\(zero\)/\10\1/g;s/\(one\)/\11\1/g;s/\(two\)/\12\1/g;s/\(three\)/\13\1/g;s/\(four\)/\14\1/g;s/\(five\)/\15\1/g;s/\(six\)/\16\1/g;s/\(seven\)/\17\1/g;s/\(eight\)/\18\1/g;s/\(nine\)/\19\1/g;s/[^0-9]//g;s/^\(.\).*\(.\)$/\1\2/g;s/^\(.\)$/\1\1/g' < input | awk '{sum+=$1} END {print sum}'


