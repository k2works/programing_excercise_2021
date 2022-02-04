import unittest


class TestFibonacci(unittest.TestCase):
    def test_fibonacci(self):
        self.assertEquals(fib(0), 0)


def fib(n):
    return 0


unittest.main(argv=[''], verbosity=2, exit=False)