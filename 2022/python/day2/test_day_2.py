from day_2 import (
    process_data,
    convert_to_base_score,
    get_scores_for_round, 
    get_round_winner, 
    set_round_scores, 
    transform_input_data,
    get_totals,
    get_overall_winner_score
    )

sample_data = '''
A Y
B X
C Z
'''

def get_test_data(data: str) -> list:
    return process_data(data)

def test_process_data():
    assert get_test_data(sample_data) == [['A', 'Y'], ['B', 'X'], ['C', 'Z']]

def test_convert_to_base_score():
    test_data = get_test_data(sample_data)
    a = test_data[0][0]
    b = test_data[1][0]
    c = test_data[2][0]
    x = test_data[1][1]
    y = test_data[0][1]
    z = test_data[2][1]
    assert convert_to_base_score(a) == 1
    assert convert_to_base_score(b) == 2
    assert convert_to_base_score(c) == 3
    assert convert_to_base_score(x) == 1
    assert convert_to_base_score(y) == 2
    assert convert_to_base_score(z) == 3

def test_calculate_round_winner():
    test_data = get_test_data(sample_data)
    round_one = get_scores_for_round(test_data[0])
    round_two = get_scores_for_round(test_data[1])
    round_three = get_scores_for_round(test_data[2])
    assert get_round_winner(round_one) == round_one.index(round_one[1])
    assert get_round_winner(round_two) == round_two.index(round_two[0])
    assert get_round_winner(round_three) == 2

def test_update_scores():
    test_data = get_test_data(sample_data)
    round_one = get_scores_for_round(test_data[0])
    round_two = get_scores_for_round(test_data[1])
    round_three = get_scores_for_round(test_data[2])
    assert set_round_scores(round_one) == [1, 8]
    assert set_round_scores(round_two) == [8, 1]
    assert set_round_scores(round_three) == [6, 6]

def test_transform_input_data():
    test_data = get_test_data(sample_data)
    processed_rounds = transform_input_data(test_data)
    processed_rounds = get_totals(processed_rounds)
    assert processed_rounds == [[1, 8], [8, 1], [6, 6]]

def test_get_overall_winner_score():
    test_data = get_test_data(sample_data)
    processed_rounds = transform_input_data(test_data)
    processed_rounds = get_totals(processed_rounds)
    assert get_overall_winner_score(processed_rounds) == 15

