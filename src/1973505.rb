require 'minitest/reporters'
Minitest::Reporters.use!
require 'minitest/autorun'
 
class FibonacciTest < Minitest::Test
  describe 'フィボナッチ数列を算出する' do
    def test_1を渡したら1を算出する
      assert_equal 1,Fibonacci.fib(1)
    end
  end
 
  describe 'フィボナッチ数列を出力する' do
    def test_1を渡したら1を返す
      assert_equal 1, Fibonacci.generate(1)
    end
 
    def test_2を渡したら1を返す
      assert_equal 1, Fibonacci.generate(2)
    end
 
    def test_3を渡したら2を返す
      assert_equal 2, Fibonacci.generate(3)
    end
 
    def test_4を渡したら3を返す
      assert_equal 3, Fibonacci.generate(4)
    end
 
    def test_5を渡したら5を返す
      assert_equal 5, Fibonacci.generate(5)
    end
  end
end
 
class Fibonacci
    MAX_NUMBER = 100
 
    def self.fib(xnum)
      if (xnum == 1 || xnum == 2)
        1
      else
        (fib(xnum - 2) + fib(xnum - 1))
      end
    end
 
    def self.generate(number)
      fib(number)
    end
 
    def self.generate_list
      #1から100までの配列を一度に作る
      (1..MAX_NUMBER).map { |n| generate(n) }
    end
  end