import math
import re

INPUT_PATH = "./input/day_06.txt"

def part_one() -> int:
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


def part_two() -> int:
    grand_total = 0

    with open(INPUT_PATH, "r") as input:
        rows = []
        operations = []

        for line in input:
            rows.append(list(line))

        operations = [i for i in rows.pop() if i.strip()]
        cols = list(zip(*rows))
        equations = []
        current_equation = []

        for col in map(list, cols):
            factors = "".join([i for i in col if i.strip()])
            current_equation.append(factors)

            if not factors.strip():
                e = [int(i) for i in current_equation if i.strip()]
                next_op = operations.pop(0)

                if next_op == "+":
                    grand_total += sum(e)
                elif next_op == "*":
                    grand_total += math.prod(e)
                current_equation = []

    return grand_total


print(f"Part one ⭐: {part_one()}")
print(f"Part two ⭐: {part_two()}")
