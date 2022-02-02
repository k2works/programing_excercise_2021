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
        self.assertEqual(1, fib(1))


def fib(n):
    if n == 0: return 0
    return 1


unittest.main(argv=[''], verbosity=2, exit=False)
