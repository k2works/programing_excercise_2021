require 'minitest/reporters'
Minitest::Reporters.use!
require 'minitest/autorun'
 
class Fibonacci
    def self.fib(n)
        return 1 if n.zero?
        return 1 if n <= 2
 
        fib(n - 1) + fib(n - 2)
    end
end
 
class FibonacciTest < Minitest::Test
    def setup
        @fib = Fibonacci
    end
 
    def test_fibonacci
        cases = [[0, 1], [1, 1], [2, 1], [3, 2], [4, 3], [5, 5]]
        cases.each do |i|
          assert_equal i[1], @fib.fib(i[0])
        end
    end
 
end
