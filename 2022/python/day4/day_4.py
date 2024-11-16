import os
import requests
from dotenv import load_dotenv

def process_part_one(data: str) -> list:
    lines = [i for i in data.strip().split("\n")]
    comparison = [l.split(",") for l in lines]
    strnums = [[x.split("-") for x in i] for i in comparison]
    return [[[int(x) for x in j] for j in i] for i in strnums]

def is_contained(group: list) -> bool:
    return (group[0][0] <= group[1][0] and group[0][1] >= group[1][1]) or \
        (group[0][0] >= group[1][0] and group[0][1] <= group[1][1])

def range_overlaps(group: list) -> bool:
    return (group[0][1] >= group[1][0]) and \
        (group[0][0] <= group[1][1])

def main():
    load_dotenv()
    cookies ={"session": os.environ["COOKIE"]}
    r = requests.get("https://adventofcode.com/2022/day/4/input", cookies=cookies)
    part_one_data = process_part_one(r.text)
    print(f"part 1: {sum([is_contained(i) for i in part_one_data])}")
    part_two_data = process_part_one(r.text)
    print(f"part 2: {sum([range_overlaps(i) for i in part_two_data])}")

if __name__ == "__main__":
    main()
