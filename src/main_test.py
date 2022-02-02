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
        self.recursive = FibonacciRecursive()
        self.loop = FibonacciLoop()
        
    def test_fibonacci(self):
        cases = [[0, 0], [1, 1], [2, 1], [3, 2], [4, 3], [5, 5]]
        for number, expected in cases:
            with self.subTest(number=number, expected=expected):
                self.assertEqual(self.recursive.exec(number), expected)

    def test_large_number_recursive(self):
        self.assertEqual(self.recursive.exec(40), 102334155)

    def test_large_number_loop(self):
        self.assertEqual(self.loop.exec(40), 102334155)

    def test_large_number_general_term(self):
        self.assertEqual(self.fib.general_term(40), 102334155)


class Fibonacci:
    def general_term(self, number):
        a = ((1 + math.sqrt(5)) / 2)**number
        b = ((1 - math.sqrt(5)) / 2)**number
        return round(((a - b) / math.sqrt(5)))

class FibonacciRecursive:
    def exec(self, number, memo={}):
        if number == 0:
            return 0
        if number <= 2:
            return 1

        if number in memo:
            return memo[number]

        memo[number] = self.exec(number - 1, memo) + self.exec(number - 2, memo)
        return memo[number]
        
class FibonacciLoop:
    def exec(self, number):
        a = 0
        b = 1
        c = 0
        for _ in range(number):
            a = b
            b = c
            c = a + b
        return c



unittest.main(argv=[''], verbosity=2, exit=False)
