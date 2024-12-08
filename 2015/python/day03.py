# part one
contents = open("input.txt", "r").read().strip()

coords_visited = [{"x": 0, "y": 0}]

for char in contents:
    current_postion = {}
    last_position = coords_visited[-1]
    if char == "^":
        current_postion["x"] = last_position["x"]
        current_postion["y"] = last_position["y"] + 1
    elif char == "v":
        current_postion["x"] = last_position["x"]
        current_postion["y"] = last_position["y"] - 1
    elif char == ">":
        current_postion["x"] = last_position["x"] + 1
        current_postion["y"] = last_position["y"]
    elif char == "<":
        current_postion["x"] = last_position["x"] - 1
        current_postion["y"] = last_position["y"]

    coords_visited.append(current_postion)

visited = [dict(t) for t in {tuple(d.items()) for d in coords_visited}]

print(len(visited))
        
        
