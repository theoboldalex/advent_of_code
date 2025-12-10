def part_one():
    total_output_joltage = 0
    max_possible_joltage = 99

    with open("./input/day_03.txt") as input:
        for row in input:
            cleaned_row = row.strip()
            maxJoltageInBank = 0

            for i in range(len(cleaned_row)):
                for j in range(i + 1, len(cleaned_row)):
                    current = int(f"{cleaned_row[i]}{cleaned_row[j]}")
                    if current == max_possible_joltage:
                        maxJoltageInBank = max_possible_joltage
                        continue

                    if current > maxJoltageInBank: maxJoltageInBank = current

            total_output_joltage += maxJoltageInBank
        
        return total_output_joltage
                

def part_two():
    return 2

print(f"part one: {part_one()}")
print(f"part two: {part_two()}")
