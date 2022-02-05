require 'minitest/reporters'
Minitest::Reporters.use!
require 'minitest/autorun'
 
class FibonacciTest < Minitest::Test
    def test_1
        assert_equal 55, Fibonacci.execute(10)		#10回計算した一番最後の数は55
    end
    def test_2
        assert_equal 1, Fibonacci.execute(1)
    end
    def test_3
        assert_equal 2, Fibonacci.execute(3)
    end
end
 
class Fibonacci
    def self.execute(a)			# a は引数　上のexecuteの中身を取ってくる
        num = []
        t = 1						# t = 1 
        (1..a).each do | i |				# (0..a)eachにしてt = 1をなくそうと思ったが
            if i <= 2								# できなかった
                num[i] = t				# mun[i]だけではかえらなかったので t とした
            else
                t = num[i - 1] + num[i - 2]		# 計算
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
