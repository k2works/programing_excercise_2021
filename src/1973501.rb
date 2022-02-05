require 'minitest/reporters'
Minitest::Reporters.use!
require 'minitest/autorun'
 
class Fibonacci
    def self.fibo(n)
      fibo = []
      for i in (1..n) do
        if i <= 2
          fibo << 1
        else
          fibo << fibo[i-3] + fibo[i-2]
        end
      end
      return fibo
    end
end
 
class FibonacciTest < Minitest::Test
  def test_１を渡したら１を返す
    assert_equal [1], Fibonacci.fibo(1)
  end
 
  def test_2を渡したら１を返す
    assert_equal [1,1], Fibonacci.fibo(2)
  end
 
  def test_3を渡したら2を返す
    assert_equal [1, 1, 2], Fibonacci.fibo(3)
  end
end
