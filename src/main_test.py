# %%
# Doctest
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
        cases = [[0, 0], [1, 1]]
        for expected, actual in cases:
            with self.subTest(expected=expected, actual=actual):
                self.assertEqual(fib(expected), actual)


def fib(n):
    if n == 0: return 0
    return 1


unittest.main(argv=[''], verbosity=2, exit=False)
