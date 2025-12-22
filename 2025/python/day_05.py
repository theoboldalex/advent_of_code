def part_one():
    ingredient_ranges = []
    available_ingredients = []
    fresh_ingredients = 0

    with open("./input/day_05.txt") as input:
        for line in map(str.strip, input):
            if "-" in line:
                ingredient_ranges.append([int(i) for i in line.split("-")])
            elif line:
                available_ingredients.append(int(line))

    for ingredient in available_ingredients:
        for nrange in ingredient_ranges:
            if ingredient >= nrange[0] and ingredient <= nrange[1]:
                fresh_ingredients += 1
                break

    return fresh_ingredients

def part_two():
    """probably not a good idea to run this one unless you have a few years to spare"""
    ingredient_ranges = []
    fresh_ingredients = []

    with open("./input/day_05.txt") as input:
        for line in map(str.strip, input):
            if "-" in line:
                number_range = [int(i) for i in line.split("-")]
                for i in range(number_range[0], number_range[1] + 1):
                    if i not in fresh_ingredients:
                        fresh_ingredients.append(i)

    return len(fresh_ingredients)

def part_two_efficient():
    ingredient_ranges = []
    fresh_ingredients = 0

    with open("./input/day_05.txt") as input:
        for line in map(str.strip, input):
            if "-" in line:
                ingredient_ranges.append([int(i) for i in line.split("-")])

    ingredient_ranges.sort()
    stack = []
    for i in range(len(ingredient_ranges)):
        current = ingredient_ranges[i]
        if not stack or stack[-1][1] < current[0]:
            stack.append(current)
        elif stack[-1][1] < current[1]:
            stack[-1][1] = current[1]

    while stack:
        top = stack.pop()
        fresh_ingredients += (top[1] - top[0]) + 1

    return fresh_ingredients

print(f"Part one: {part_one()}")
# print(f"Part two: {part_two()}")
print(f"Part two efficient: {part_two_efficient()}")
