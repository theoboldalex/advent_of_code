import os
import requests
from dotenv import load_dotenv
from day_2 import get_scores_for_round, process_data

def get_choice(round: list) -> int:
    # noob solution, but I only had 10 mins spare :D
    round = get_scores_for_round(round)
    if round[1] == 2:
        return round[0] + 3
    if round[1] == 3:
        if round[0] == 1:
            return 8
        if round[0] == 2:
            return 9
        if round[0] == 3:
            return 7
    if round[1] == 1:
        if round[0] == 1:
            return 3
        if round[0] == 2:
            return 1
        if round[0] == 3:
            return 2
    return round[0]

def main():
    load_dotenv()
    cookies = {"session": os.environ["COOKIE"]}
    r = requests.get("https://adventofcode.com/2022/day/2/input", cookies=cookies)
    data = [get_choice(round) for round in process_data(r.text)]
    print(f"part 2: {sum(data)}")

if __name__ == "__main__":
    main()
