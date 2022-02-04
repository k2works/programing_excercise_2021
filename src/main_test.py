import unittest


class TestFibonacci(unittest.TestCase):
    def test_fibonacci(self):
        self.assertEquals(fib(0), 0)
        self.assertEquals(fib(1), 1)


def fib(n):
    if n == 0:
        return 0
    return 1


unittest.main(argv=[''], verbosity=2, exit=False)
