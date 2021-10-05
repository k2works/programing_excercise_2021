import unittest


class Money:
    def __init__(self, amount, currency) -> None:
        self.amount = amount
        self.currency = currency

    def __str__(self) -> str:
        if self.currency == 'JPY':
            return f'¥{self.amount}'
        elif self.currency == 'USD':
            return f'${self.amount}'
        else:
            return f'{self.amount}{self.currency}'

class TestMoney(unittest.TestCase):
    def test_金額を表示する(self):
        千円 = Money(1000, 'JPY')
        一万円 = Money(10000, 'JPY')
        self.assertEqual(str(千円), '¥1000')
        self.assertEqual(str(一万円), '¥10000')

    def test_外貨金額を表示する(self):
        千ドル = Money(1000, 'USD')
        self.assertEqual(str(千ドル), '$1000')

unittest.main(argv=[''], verbosity=2, exit=False)
