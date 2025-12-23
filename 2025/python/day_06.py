import math
import re

INPUT_PATH = "./input/day_06.txt"

def part_one():
    grand_total = 0
    with open(INPUT_PATH, "r") as input:
        rows = []
        for line in map(str.strip, input):
            row = re.split("\s+", line)
            rows.append(row)

        cols = list(zip(*rows))
        for col in map(list, cols):
            operator = col.pop()
            factors = [int(i) for i in col]
            
            if operator == "+":
                grand_total += sum(factors)
            elif operator == "*":
                grand_total += math.prod(factors)

    return grand_total

print(f"Part one: {part_one()}")
