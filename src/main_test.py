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

    def __eq__(self, o: object) -> bool:
        return self.amount == o.amount and self.currency == o.currency

class TestMoney(unittest.TestCase):
    def setUp(self) -> None:
        self.千円 = Money(1000, 'JPY')
        self.一万円 = Money(10000, 'JPY')
        self.千ドル = Money(1000, 'USD')

    def test_金額を表示する(self):
        self.assertEqual(str(self.千円), '¥1000')
        self.assertEqual(str(self.一万円), '¥10000')

    def test_外貨金額を表示する(self):
        self.assertEqual(str(self.千ドル), '$1000')

    def test_金額を比較する(self):
        self.assertEqual(self.千円, Money(1000, 'JPY'))
        self.assertNotEqual(self.千円, Money(1000, 'USD'))

unittest.main(argv=[''], verbosity=2, exit=False)
