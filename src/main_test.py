# %%
# Doctest
import math
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

    def test_large_number(self):
        self.assertEqual(self.fib.calc(40), 102334155)

    def test_large_number_calc2(self):
        self.assertEqual(self.fib.calc2(40), 102334155)

    def test_large_number_calc3(self):
        self.assertEqual(self.fib.calc3(40), 102334155)


class Fibonacci:
    def calc(self, number, memo = {}):
        if number == 0:
            return 0
        if number <= 2:
            return 1

        if number in memo:
            return memo[number]

        memo[number] = self.calc(number - 1, memo) + self.calc(number - 2, memo)
        return memo[number]
        
    def calc2(self, number):
        a = 0
        b = 1
        c = 0
        for i in range(number):
            a = b
            b = c
            c = a + b
        return c

    def calc3(self, number):
        a = ((1 + math.sqrt(5)) / 2)**number
        b = ((1 - math.sqrt(5)) / 2)**number
        return round(((a - b) / math.sqrt(5)))


unittest.main(argv=[''], verbosity=2, exit=False)
