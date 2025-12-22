def part_one():
    ingredient_ranges = []
    available_ingredients = []
    fresh_ingredients = 0

    with open("./input/day_05.txt") as input:
        for line in map(str.strip, input):
            if "-" in line:
                number_range = line.split("-")
                ingredient_ranges.append([int(i) for i in number_range])
            elif line:
                available_ingredients.append(int(line))

    for ingredient in available_ingredients:
        for nrange in ingredient_ranges:
            if ingredient >= nrange[0] and ingredient <= nrange[1]:
                fresh_ingredients += 1
                break

    return fresh_ingredients

print(f"Part one: {part_one()}")
