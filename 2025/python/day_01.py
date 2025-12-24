def part_one():
    start_pos = 50
    current_pos = start_pos
    answer = 0

    with open("./input/day_01.txt") as input:
        for row in input:
            clean_row = row.strip()
            direction = clean_row[0]
            distance = int(clean_row[-1] if len(row) <= 3 else clean_row[-2:])

            current_pos = current_pos + distance if direction == "L" else current_pos - distance
            if current_pos > 99: current_pos -= 100
            elif current_pos < 0: current_pos += 100
            if current_pos == 0: answer += 1

    return answer

def part_two():
    start_pos = 50
    current_pos = start_pos
    answer = 0

    with open("./input/day_01.txt") as input:
        for row in input:
            clean_row = row.strip()
            direction = clean_row[0]
            distance = int(clean_row[1:])

            for i in range(distance):
                current_pos = current_pos + 1 if direction == "L" else current_pos - 1
                if current_pos > 99: current_pos -= 100
                elif current_pos < 0: current_pos += 100
                if current_pos == 0: answer += 1 

    return answer

print(f"Part one ⭐: {part_one()}")
print(f"Part two ⭐: {part_two()}")
