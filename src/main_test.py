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
    def setUp(self) -> None:
        self.fib = Fibonacci()
        
    def test_fibonacci(self):
        cases = [[0, 0], [1, 1], [2, 1], [3, 2], [4, 3], [5, 5]]
        for number, expected in cases:
            with self.subTest(number=number, expected=expected):
                self.assertEqual(self.fib.calc(number), expected)


class Fibonacci:
    def calc(self, number):
        if number == 0:
            return 0
        if number <= 2:
            return 1

        return self.calc(number - 1) + self.calc(number - 2)



unittest.main(argv=[''], verbosity=2, exit=False)
