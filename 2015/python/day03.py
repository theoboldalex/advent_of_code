contents = open("input.txt", "r").read().strip()

# part one
coords_visited = [(0, 0)]

for char in contents:
    if char == "^":
        coords_visited.append(
            (coords_visited[-1][0], coords_visited[-1][1] + 1)
        )
    elif char == "v":
        coords_visited.append(
            (coords_visited[-1][0], coords_visited[-1][1] - 1)
        )
    elif char == ">":
        coords_visited.append(
            (coords_visited[-1][0] + 1, coords_visited[-1][1])
        )
    elif char == "<":
        coords_visited.append(
            (coords_visited[-1][0] - 1, coords_visited[-1][1])
        )

print(len(set(coords_visited)))

# part two
