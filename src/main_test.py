# %%
# Doctest
import numbers
import unittest
import doctest


def add(a, b):
    """Return the sum of a and b.
    >>> add(2, 2)
    4
    """
    sum = a
    return sum


doctest.testmod(verbose=True)

# %%
# Unittest


class FibonacciTest(unittest.TestCase):
    def test_fibonacci(self):
        cases = [[0, 0], [1, 1], [2, 1], [3, 2]]
        for number, expected in cases:
            with self.subTest(number=number, expected=expected):
                self.assertEqual(fib(number), expected)


def fib(n):
    if n == 0: return 0
    if n <= 2: return 1
    return 2


unittest.main(argv=[''], verbosity=2, exit=False)
