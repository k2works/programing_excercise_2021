import unittest

from pkg_resources import find_distributions


class TestFibonacci(unittest.TestCase):
    def setUp(self) -> None:
        self.fib = Fibonacci()

    def test_fibonacci(self):
        cases = [[0, 0], [1, 1], [2, 1], [3, 2], [4, 3], [5, 5]]
        for number, expected in cases:
            with self.subTest(number=number, expected=expected):
                self.assertEqual(self.fib.fib(number), expected)


class Fibonacci:
    def fib(self, number):
        if number == 0:
            return 0
        if number <= 2:
            return 1

        return self.fib(number - 1) + self.fib(number - 2)


unittest.main(argv=[''], verbosity=2, exit=False)
