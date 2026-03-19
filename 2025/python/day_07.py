INPUT_PATH = "./input/day_07.txt"
START_CHAR = "S"
BEAM_SPLITTER_CHAR = "^"

def part_one() -> int:
    splits = 0
    beams = set([])

    with open(INPUT_PATH, "r") as input:
        for idx, line in enumerate(map(str.strip, input)):
            if START_CHAR in line:
                beams.add(line.index(START_CHAR))
                continue

            for idx, char in enumerate(line):
                if char == BEAM_SPLITTER_CHAR and idx in beams:
                    splits += 1
                    beams.discard(idx)
                    beams.add(idx + 1)
                    beams.add(idx - 1)
    return splits

def part_two() -> int:
    with open(INPUT_PATH, "r") as input:
        # split into rows and columns
        pass

    return 1

def unique_paths(rows, cols, memo = {}) -> int:
    if rows == 1 or cols == 1:
        return 1

    if rows not in memo and cols not in memo:
        memo[(rows, cols)] = unique_paths(rows - 1, cols, memo) + unique_paths(rows, cols - 1, memo)

    return memo[(rows, cols)]

print(f"Part one ⭐: {part_one()}")
print(f"Part two: {part_two()}")
