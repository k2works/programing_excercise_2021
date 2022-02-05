require 'minitest/reporters'
Minitest::Reporters.use!
require 'minitest/autorun'
 
class FiboTest < Minitest::Test
    def test_1
        assert_equal 1, Fibo.generate(1)
    end
 
    def test_2
       assert_equal 1, Fibo.generate(2)
    end
 
    def test_3
        assert_equal 2, Fibo.generate(3)
    end
 
    def test_4
        assert_equal 3, Fibo.generate(4)
    end
 
    def test_5
        assert_equal 5, Fibo.generate(5)
    end
end

class Fibo
	array = []
	@a = array
	def self.generate(number)
	    total = 1
	    @t = total
	    (1..number).each do |i|
		if i <= 2
		    @a[i] = @t
		else
		@t = @a[i - 1] + @a[i - 2]
		@a[i] = @t
		end
	    end
	    return @t
	end
    end

    class Fibonatti
	puts"何項目数行いますか？"
	n = gets.to_i
	while n < 0
	    puts"１より大きい数字を入力してください。"
	    n = gets.to_i
	end
     
	for i in 1..n
	    p Fibo.generate(i)
	end
    end
       