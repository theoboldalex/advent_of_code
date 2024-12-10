import re

# part one
def is_string_nice(str):
    for s in ["ab", "cd", "pq", "xy"]:
        if s in str:
            return False

    vowels = "aeiou"
    vowel_count = 0
    for char in str:
        if char in vowels:
            vowel_count += 1
            
    if vowel_count < 3:
        return False

    repeat_chars = re.findall(r"((.)\2)*", str)
    for t in repeat_chars:
        if t != ('', ''):
            return True
    
    return False

input = open("input.txt", "r")
answer = 0
for s in input:
    if is_string_nice(s):
        answer += 1

print(f"part one: {answer}")
    
# part two
def has_overlap(l):
    hash_map = {}
    for (idx, el) in enumerate(l):
        if el in hash_map and el == l[idx-1]:
            return True

        hash_map[el] = idx
        
    return False

def is_string_still_nice(str):
    pairs = []
    for (idx, char) in enumerate(str):
        if idx == len(str):
            break

        current_chunk = str[idx:idx+2]
        pairs.append(current_chunk)

    if len(set(pairs)) == len(pairs):
        return False
    else:
        if has_overlap(pairs):
            return False

    for (idx, char) in enumerate(str):
        if idx == len(str) - 2:
            return False

        if char == str[idx+2]:
            return True

    return True

            
input = open("input.txt", "r")
part_two_answer = 0
for s in input:
    if is_string_still_nice(s.strip()):
        part_two_answer += 1
        
print(f"part two: {part_two_answer}")
