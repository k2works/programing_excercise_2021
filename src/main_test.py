import unittest


class Money:
    YEN = 'JPY'
    DOLLAR = 'USD'

    def __init__(self, amount, currency) -> None:
        self.amount = amount
        self.currency = currency

    def __str__(self) -> str:
        if self.currency == Money.YEN:
            return f'¥{self.amount}'
        elif self.currency == Money.DOLLAR:
            return f'${self.amount}'
        else:
            return f'{self.amount}{self.currency}'

    def __eq__(self, other: object) -> bool:
        return self.amount == other.amount and self.currency == other.currency

    def __hash__(self) -> int:
        return hash((self.amount, self.currency))

    def add(self, other: object) -> object:
        if self.currency != other.currency:
            raise ValueError('通貨が異なります')
        return Money(self.amount + other.amount, self.currency)


class TestMoney(unittest.TestCase):
    def setUp(self) -> None:
        self.千円 = Money(1000, Money.YEN)
        self.一万円 = Money(10000, Money.YEN)
        self.千ドル = Money(1000, Money.DOLLAR)

    def test_金額を表示する(self):
        self.assertEqual(str(self.千円), '¥1000')
        self.assertEqual(str(self.一万円), '¥10000')
        self.assertEqual(str(self.千ドル), '$1000')

    def test_金額を比較する(self):
        self.assertEqual(self.千円, Money(1000, Money.YEN))
        self.assertNotEqual(self.千円, Money(1000, Money.DOLLAR))

    def test_通貨を保持する(self):
        財布 = {self.千円}
        self.assertTrue(self.千円 in 財布)
        self.assertFalse(self.千ドル in 財布)

    def test_金額を計算する(self):
        二千円 = self.千円.add(Money(1000, Money.YEN))
        self.assertEqual(二千円, Money(2000, Money.YEN))
        with self.assertRaises(ValueError, msg='通貨が異なります'):
            self.千円.add(Money(1000, Money.DOLLAR))


unittest.main(argv=[''], verbosity=2, exit=False)
