#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

[[ "${1:-}" =~ ^[0-9]+$ ]] || { echo "usage: $0 <day number>" >&2; exit 1; }
day="day$1"
[[ -e "$day.c" ]] && { echo "$day.c already exists" >&2; exit 1; }

cat > "$day.c" <<EOF
#include <stdio.h>

int main(void) {
    int part_one_answer = 0;
    int part_two_answer = 0;

    printf("Day $1\n");
    printf("part one: %d\n", part_one_answer);
    printf("part two: %d\n", part_two_answer);
    return 0;
}
EOF

# Makefile may lack a trailing newline
[[ -s Makefile && -n "$(tail -c1 Makefile)" ]] && echo >> Makefile
printf '\ndist/%s: %s.c\n\t@mkdir -p dist\n\tgcc -o dist/%s %s.c -Wall -Wextra -pedantic -std=c99\n' "$day" "$day" "$day" "$day" >> Makefile
