# part one
part_one = 0
with open("input.txt") as f:
    for line in f:
        for char in line:
            if char == "(":
                part_one += 1
            elif char == ")":
                part_one -= 1
            else:
                pass

print(part_one)    

# part two
part_two = 0
with open("input.txt") as f:
    for line in f:
        for (idx, char) in enumerate(line):
            if part_two >= 0:
                if char == "(":
                    part_two += 1
                elif char == ")":
                    part_two -= 1
                else:
                    pass
            else:
                print(idx)
                break
