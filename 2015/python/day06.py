import re

input = open("input.txt", "r")

# part one

grid = [[0 for i in range(1000)] for j in range(1000)]

def parse_line(line):
    nums = re.findall(r"\d+", line)
    start, end = nums[:2], nums[2:]
    action = re.search(r"^[a-z\s]+", line)[0] \
               .strip() \
               .replace("turn ", "")
    start = [int(i) for i in start]
    end = [int(i) for i in end]
    return (action, (start, end))

for line in input:
    parsed_line = parse_line(line)
    start_point = parsed_line[1][0]
    end_point = parsed_line[1][1]
    start_pos, start_row = start_point
    end_pos, end_row = end_point

    if parsed_line[0] == "on":
        for idx, row in enumerate(grid):
            # are we within the vertical range to turn on lights?
            if idx >= start_row and idx <= end_row:
                for k, v in enumerate(row):
                    if k >= start_pos and k <= end_pos:
                        grid[idx][k] = 1
    elif parsed_line[0] == "off":
        for idx, row in enumerate(grid):
            # are we within the vertical range to turn on lights?
            if idx >= start_row and idx <= end_row:
                for k, v in enumerate(row):
                    if k >= start_pos and k <= end_pos:
                        grid[idx][k] = 0
    else:
        for idx, row in enumerate(grid):
            # are we within the vertical range to turn on lights?
            if idx >= start_row and idx <= end_row:
                for k, v in enumerate(row):
                    if k >= start_pos and k <= end_pos:
                        if grid[idx][k] == 0:
                            grid[idx][k] = 1
                        else:
                            grid[idx][k] = 0
                        
answer = 0
for row in grid:
    for i in row:
        if i == 1:
            answer += 1

print(answer)
