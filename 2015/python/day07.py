import re

# part one
input = open("input.txt", "r")
wires = {}

def parse_line(line):
    instruction = line.strip().split(" ")
    del instruction[-2]
    return instruction

for line in input:
    instruction = parse_line(line)
    signal = 0
    wire = instruction[-1]

    # after calculation, update hashmap
    if wire in wires:
        wires[wire] += signal
    else:
        wires[wire] = signal

print(wires)
