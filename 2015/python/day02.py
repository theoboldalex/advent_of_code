# part one
total = 0
with open("input.txt", "r") as file:
    for line in file:
        parts = [int(i) for i in line.strip().split("x")]
        sides = [
            parts[0] * parts[1],
            parts[1] * parts[2],
            parts[2] * parts[0]
        ]
        slack = min(sides)

        total += (2 * sum(sides)) + slack


print(total)







# part two
