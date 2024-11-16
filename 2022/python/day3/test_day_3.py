from day_3 import (  
    process_part_one,
    process_part_two,
    get_dupe_item,
    get_common_item,
    encode_char_to_int
)

sample_data = '''
vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw
'''

def get_part_one_data() -> list:
    return process_part_one(sample_data)

def get_part_two_data() -> list:
    return process_part_two(sample_data)

def test_process_part_one():
    assert get_part_one_data() == [
        ['vJrwpWtwJgWr', 'hcsFMMfFFhFp'],
        ['jqHRNqRjqzjGDLGL', 'rsFMfFZSrLrFZsSL'],
        ['PmmdzqPrV', 'vPwwTWBwg'],
        ['wMqvLMZHhHMvwLH', 'jbvcjnnSBnvTQFn'],
        ['ttgJtRGJ', 'QctTZtZT'],
        ['CrZsJsPPZsGz', 'wwsLwLmpwMDw'],
    ]

def test_process_part_two():
    assert get_part_two_data() == [
        ['vJrwpWtwJgWrhcsFMMfFFhFp', 'jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL', 'PmmdzqPrVvPwwTWBwg'],
        ['wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn', 'ttgJtRGJQctTZtZT', 'CrZsJsPPZsGzwwsLwLmpwMDw'],
    ]

def test_get_dupe_item():
    data = get_part_one_data()
    assert get_dupe_item(data[0]) == 'p'

def test_encode_char_to_int():
    data = get_part_one_data()
    char = get_dupe_item(data[0])
    assert encode_char_to_int(char) == 16 # "p".charCode() - 96

def test_get_common_item():
    data = get_part_two_data()
    assert get_common_item(data[0]) == 'r'
