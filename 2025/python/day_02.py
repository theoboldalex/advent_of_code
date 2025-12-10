import re

def part_one():
    with open("./input/day_02.txt") as input:
        invalid = []
        id_ranges = [tuple(i.split("-")) for i in input.read().strip().split(",")]

        for min, max in id_ranges:
            for i in range(int(min), int(max)):
                if re.search(r"^(\d+)\1$", str(i)): invalid.append(i)

        return sum(invalid)

def part_two():
    with open("./input/day_02.txt") as input:
        invalid = []
        id_ranges = [tuple(i.split("-")) for i in input.read().strip().split(",")]

        for min, max in id_ranges:
            for i in range(int(min), int(max)):
                if re.search(r"^(\d+)\1+$", str(i)): invalid.append(i)

        return sum(invalid)

print(f"part one: {part_one()}")
print(f"part two: {part_two()}")
