from day_2 import process_data
from day_2_part_2 import get_choice

sample_data = '''
A Y
B X
C Z
'''

TEST_DATA = process_data(sample_data)

def test_get_choice():
    rounds = [get_choice(round) for round in TEST_DATA]
    assert rounds[0] == 4
    assert rounds[1] == 1
    assert rounds[2] == 7

def test_get_answer():
    rounds = [get_choice(round) for round in TEST_DATA]
    assert sum(rounds) == 12
