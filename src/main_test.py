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
        self.assertEqual(0, fib(0))

def fib(n):
    return 0

unittest.main(argv=[''], verbosity=2, exit=False)