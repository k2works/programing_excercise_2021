import unittest

from pkg_resources import find_distributions


class TestFibonacci(unittest.TestCase):
    def test_fibonacci(self):
        cases = [[0, 0], [1, 1], [2, 1],[3, 2], [4, 3], [5, 5]]
        for number, expected in cases:
            with self.subTest(number=number, expected=expected):
                self.assertEqual(fib(number), expected)


def fib(n):
    if n == 0:
        return 0
    if n <= 2:
        return 1

    return fib(n - 1) + fib(n - 2)


unittest.main(argv=[''], verbosity=2, exit=False)
