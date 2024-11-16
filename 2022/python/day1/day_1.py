import os
import requests
from dotenv import load_dotenv

def process_data(data: str) -> list:
    return [sum([int(i) for i in l.split("\n")]) for l in data.strip().split("\n\n")]

def get_top(data: str, limit: int = 1) -> list:
    l = process_data(data)
    l.sort(reverse=True)
    return l[:limit]

def main():
    load_dotenv()
    cookies = {"session": os.environ["COOKIE"]}
    r = requests.get("https://adventofcode.com/2022/day/1/input", cookies=cookies)
    print(f"part 1: {get_top(r.text)[0]}")
    print(f"part 2: {sum(get_top(r.text, 3))}")

if __name__ == "__main__":
    main()
