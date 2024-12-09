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

coords_visited = {
    "santa": [(0, 0)],
    "robot": [(0, 0)]
}

for (idx, char) in enumerate(contents):
    if idx % 2 == 0:
        if char == "^":
            coords_visited["santa"].append(
                (coords_visited["santa"][-1][0], coords_visited["santa"][-1][1] + 1)
            )
        elif char == "v":
            coords_visited["santa"].append(
                (coords_visited["santa"][-1][0], coords_visited["santa"][-1][1] - 1)
            )
        elif char == ">":
            coords_visited["santa"].append(
                (coords_visited["santa"][-1][0] + 1, coords_visited["santa"][-1][1])
            )
        elif char == "<":
            coords_visited["santa"].append(
                (coords_visited["santa"][-1][0] - 1, coords_visited["santa"][-1][1])
            )
    else:
        if char == "^":
            coords_visited["robot"].append(
                (coords_visited["robot"][-1][0], coords_visited["robot"][-1][1] + 1)
            )
        elif char == "v":
            coords_visited["robot"].append(
                (coords_visited["robot"][-1][0], coords_visited["robot"][-1][1] - 1)
            )
        elif char == ">":
            coords_visited["robot"].append(
                (coords_visited["robot"][-1][0] + 1, coords_visited["robot"][-1][1])
            )
        elif char == "<":
            coords_visited["robot"].append(
                (coords_visited["robot"][-1][0] - 1, coords_visited["robot"][-1][1])
            )

print(len(set(coords_visited["santa"] + coords_visited["robot"])))
