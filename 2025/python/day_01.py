def part_one():
    start_pos = 50
    current_pos = start_pos
    answer = 0

    with open("./input/day_01.txt") as input:
        for row in input:
            clean_row = row.strip()
            direction = clean_row[0]
            distance = int(clean_row[-1] if len(row) <= 3 else clean_row[-2:])

            if direction == "L":
                current_pos -= distance
                if current_pos < 0: current_pos += 100
            else:
                current_pos += distance
                if current_pos > 99: current_pos -= 100

            if current_pos == 0: answer += 1

    return answer

def part_two():
    return 2

print(f"part one: {part_one()}")
print(f"part two: {part_two()}")
