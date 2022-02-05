require 'minitest/reporters'
Minitest::Reporters.use!
require 'minitest/autorun'
 
class FiboTest < Minitest::Test
    def test_Fibo
        assert_equal 1, Fibo.generate(1)
    end
 
    def test_Fibo2
        assert_equal 1, Fibo.generate(2)
    end
 
    def test_Fibo3
        assert_equal 2, Fibo.generate(3)
    end
 
    def test_Fibo4
        assert_equal 55, Fibo.generate(10)
    end
end
 
class Fibo
    def self.generate(n)
        array = []
        for w in 1..n
            if w <= 2
                array[w] = 1
            else
                array[w] = array[w-1] + array[w-2]
            end
        end
        p array[w]
        return array[w]
    end
end
