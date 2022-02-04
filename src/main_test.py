import unittest

from pkg_resources import find_distributions


class TestFibonacci(unittest.TestCase):
    def setUp(self) -> None:
        self.fib = Fibonacci()

    def test_fibonacci(self):
        cases = [[0, 0], [1, 1], [2, 1], [3, 2], [4, 3], [5, 5]]
        for number, expected in cases:
            with self.subTest(number=number, expected=expected):
                self.assertEqual(self.fib.calc(number), expected)

    def test_large_number(self):
        self.assertEqual(self.fib.calc(40), 102_334_155)


class Fibonacci:
    def calc(self, number, memo={}):
        if number == 0:
            return 0
        if number <= 2:
            return 1

        if number in memo:
            return memo[number]

        memo[number] = self.calc(number - 1, memo) + \
            self.calc(number - 2, memo)
        return memo[number]


unittest.main(argv=[''], verbosity=2, exit=False)
