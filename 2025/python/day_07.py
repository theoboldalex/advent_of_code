INPUT_PATH = "./input/day_07.txt"
START_CHAR = "S"
BEAM_SPLITTER_CHAR = "^"

def part_one():
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

print(f"Part one: {part_one()}")
