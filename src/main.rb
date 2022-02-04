# frozen_string_literal: true

require 'minitest/reporters'
Minitest::Reporters.use!
require 'minitest/autorun'

class FibonacciTest < Minitest::Test
  def setup
    @fib = Fibonacci
  end

  def test_fibonacci
    cases = [[0,0], [1,1], [2,1], [3,2], [4,3]]
    cases.each do |i|
      assert_equal i[1], @fib.calc(i[0])
    end
  end

  def test_large_number
    assert_equal 102_334_155, @fib.calc(40)
  end
end

class Fibonacci
  def self.calc(number, memo={})
    return 0 if number.zero?
    return 1 if number == 1

    memo[number] ||= calc(number - 1, memo) + calc(number - 2, memo)
  end
end