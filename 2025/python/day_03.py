def part_one():
    total_output_joltage_by_row = []

    with open("./input/day_03.txt") as input:
        for row in input:
            cleaned_row = row.strip()
            maxJoltageInBank = 0

            for i in range(len(cleaned_row)):
                for j in range(i + 1, len(cleaned_row)):
                    current = int(f"{cleaned_row[i]}{cleaned_row[j]}")
                    if current == 99:
                        maxJoltageInBank = 99
                        continue

                    if current > maxJoltageInBank: maxJoltageInBank = current

            total_output_joltage_by_row.append(maxJoltageInBank)
        
        return sum(total_output_joltage_by_row)
                

def part_two():
    return 2

print(f"part one: {part_one()}")
print(f"part two: {part_two()}")
