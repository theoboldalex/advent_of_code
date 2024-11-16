from day_4 import (
    process_part_one,
    is_contained,
    range_overlaps
)

SAMPLE_DATA = '''
2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8
'''

def get_part_one_data():
    return process_part_one(SAMPLE_DATA)

def test_process_part_one():
    print(get_part_one_data())
    assert get_part_one_data() == [
        [[2, 4], [6, 8]],
        [[2, 3], [4, 5]],
        [[5, 7], [7, 9]],
        [[2, 8], [3, 7]],
        [[6, 6], [4, 6]],
        [[2, 6], [4, 8]]
    ]

def test_contained_range():
    expect_not_contained = is_contained(get_part_one_data()[0])
    expect_contained = is_contained(get_part_one_data()[3])
    assert expect_not_contained == False
    assert expect_contained == True

def test_ranges_overlap():
    expect_not_to_overlap = range_overlaps(get_part_one_data()[0])
    expect_to_overlap = range_overlaps(get_part_one_data()[5])
    assert expect_not_to_overlap == False
    assert expect_to_overlap == True
