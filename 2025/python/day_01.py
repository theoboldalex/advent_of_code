def part_one():
    start_pos = 50
    current_pos = start_pos
    answer = 0

    with open("./input/day_01.txt") as input:
        for row in input:
            direction = row[0]
            if len(row) <= 3:
                distance = int(row.strip()[-1])
            else:
                distance = int(row.strip()[-2:])

            if direction == "L":
                current_pos -= distance
                if current_pos < 0:
                    current_pos += 100
            elif direction == "R":
                current_pos += distance
                if current_pos > 99:
                    current_pos -= 100

            if current_pos == 0:
                answer += 1

    return answer

def part_two():
    return 2

print(f"part one: {part_one()}")
print(f"part two: {part_two()}")
