import math
import unittest

from pkg_resources import find_distributions


class TestFibonacci(unittest.TestCase):
    def setUp(self) -> None:
        self.fib = Fibonacci()
        self.recursive = FibonacciRecursive()

    def test_fibonacci(self):
        cases = [[0, 0], [1, 1], [2, 1], [3, 2], [4, 3], [5, 5]]
        for number, expected in cases:
            with self.subTest(number=number, expected=expected):
                self.assertEqual(self.recursive.exec(number), expected)

    def test_large_number_recursive(self):
        self.assertEqual(self.recursive.exec(40), 102_334_155)

    def test_large_number_2(self):
        self.assertEqual(self.fib.loop(40), 102_334_155)

    def test_large_number_3(self):
        self.assertEqual(self.fib.general_term(40), 102_334_155)

class Fibonacci:
    def loop(self, number):
        a = 0
        b = 1
        c = 0
        for _ in range(number):
            a = b
            b = c
            c = a + b
        return c

    def general_term(self, number):
        a = ((1 + math.sqrt(5)) / 2) ** number
        b = ((1 - math.sqrt(5)) / 2) ** number
        return round( (a - b) / math.sqrt(5) )

class FibonacciRecursive:
    def exec(self, number, memo={}):
        if number == 0:
            return 0
        if number <= 2:
            return 1

        if number in memo:
            return memo[number]

        memo[number] = self.exec(number - 1, memo) + \
            self.exec(number - 2, memo)
        return memo[number]

unittest.main(argv=[''], verbosity=2, exit=False)
