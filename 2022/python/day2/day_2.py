import os
import requests
from dotenv import load_dotenv

def process_data(data: str) -> list:
    return [x.split() for x in data.strip().split("\n")]

def convert_to_base_score(letter: str) -> int:
    if letter in ["A", "X"]:
        return 1
    if letter in ["B", "Y"]:
        return 2
    if letter in ["C", "Z"]:
        return 3

def get_scores_for_round(scores: list) -> list:
   return [convert_to_base_score(score) for score in scores]

def get_round_winner(scores: list) -> int:
    # case for a draw - quick and dirty
    if scores[0] == scores[1]:
        return 2
    if scores in [[1, 2], [2, 3], [3, 1]]:
        return 1
    return 0

def set_round_scores(round: list) -> list:
    round_winner = get_round_winner(round)
    if round_winner < 2:
        round[round_winner] += 6
        return round
    return [i + 3 for i in round]

def transform_input_data(data: list) -> list:
    return [get_scores_for_round(i) for i in data]

def get_totals(scores: list) -> list:
    return [set_round_scores(i) for i in scores]

def get_overall_winner_score(scores: list) -> int:
    return sum([score[1] for score in scores])

def main():
    load_dotenv()
    cookies = {"session": os.environ["COOKIE"]}
    r = requests.get("https://adventofcode.com/2022/day/2/input", cookies=cookies)
    input_data = transform_input_data(process_data(r.text))
    totals = get_totals(input_data)
    print(f"part 1: {get_overall_winner_score(totals)}")
    # print(f"part 2: {}")

if __name__ == "__main__":
    main()
