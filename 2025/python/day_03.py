def part_one():
    total_output_joltage = 0

    with open("./input/day_03.txt") as input:
        for row in map(str.strip, input):
            max_joltage_in_bank = 0
            row_length = len(row)
            
            for i in range(row_length):
                for j in range(i + 1, row_length):
                    current = int(f"{row[i]}{row[j]}")
                    if current > max_joltage_in_bank: max_joltage_in_bank = current

            total_output_joltage += max_joltage_in_bank
        
    return total_output_joltage
                

def part_two():
    total_output_joltage = 0

    with open("./input/day_03.txt") as input:
        for row in map(str.strip, input):
            stack = []
            distance_from_twelve = max(0, len(row) - 12)

            for digit in row:
                while stack and distance_from_twelve > 0 and stack[-1] < digit:
                    stack.pop()
                    distance_from_twelve -= 1
                stack.append(digit)
            
            total_output_joltage += int(''.join(stack[:12]))

    return total_output_joltage

print(f"part one: {part_one()}")
print(f"part two: {part_two()}")
