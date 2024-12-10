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
    
