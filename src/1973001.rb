require 'minitest/reporters'
Minitest::Reporters.use!
require 'minitest/autorun'
 
class FibonacciTest < Minitest::Test
    def test_1
        assert_equal 55, Fibonacci.execute(10)
    end
    def test_2
        assert_equal 1, Fibonacci.execute(1)
    end
    def test_3
        assert_equal 2, Fibonacci.execute(3)
    end
end
 
class Fibonacci
    def self.execute(a)
        num = []
        t = 1
        (1..a).each do | i |
            if i <= 2		#最初の２項は１を出力するために２
                num[i] = t
            else
                t = num[i - 1] + num[i - 2]
                num[i] = t
            end
        end
        return t
    end
end
 
class Fibo
    puts "何回しますか。"
    x = gets.to_i
    while x <=0
        puts"1よりも大きい数値を入力してください。"
        x = gets.to_i
    end
    for y in 1..x
        p Fibonacci.execute(y)
    end
end
