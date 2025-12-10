def part_one():
    total_output_joltage = 0
    max_possible_joltage = 99

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
    return 2

print(f"part one: {part_one()}")
print(f"part two: {part_two()}")
