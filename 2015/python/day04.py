import hashlib

# part one
puzzle_input = "iwrupvqb"
answer_found = False

def answer_starts_with_five_zeroes(hex):
    return hex[:5] == "00000"

def part_one(puzzle_input):
    answer = 1
    while True:
        current_guess = f"{puzzle_input}{answer}"
        hash = hashlib.md5(current_guess.encode("UTF-8")).hexdigest()
        if answer_starts_with_five_zeroes(hash):
            return answer
        answer += 1

print(part_one(puzzle_input))

# part two
def answer_starts_with_six_zeroes(hex):
    return hex[:6] == "000000"

def part_two(puzzle_input):
    answer = 1
    while True:
        current_guess = f"{puzzle_input}{answer}"
        hash = hashlib.md5(current_guess.encode("UTF-8")).hexdigest()
        if answer_starts_with_six_zeroes(hash):
            return answer
        answer += 1

print(part_two(puzzle_input))
