from day_1 import get_top

########## TESTS ############
sample_data = '''
1000
2000
3000

4000

5000
6000

7000
8000
9000

10000
'''

def test_get_top():
    assert get_top(sample_data)[0] == 24000

def test_get_top_three():
    assert sum(get_top(sample_data, 3)) == 45000
