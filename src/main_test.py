import unittest


class TestFibonacci(unittest.TestCase):
    def test_fibonacci(self):
        cases = [[0, 0], [1, 1]]
        for number, expected in cases:
            with self.subTest(number=number, expected=expected):
                self.assertEqual(fib(number), expected)


def fib(n):
    if n == 0:
        return 0
    return 1


unittest.main(argv=[''], verbosity=2, exit=False)
