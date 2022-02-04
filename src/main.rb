# frozen_string_literal: true

require 'minitest/reporters'
Minitest::Reporters.use!
require 'minitest/autorun'

class FibonacciTest < Minitest::Test
  def setup
    @fib = Fibonacci
    @recursive = FibonacciRecursive.new
  end

  def test_fibonacci
    cases = [[0,0], [1,1], [2,1], [3,2], [4,3]]
    cases.each do |i|
      assert_equal i[1], @recursive.exec(i[0])
    end
  end

  def test_large_number_recursive
    assert_equal 102_334_155, @recursive.exec(40)
  end

  def test_large_number_loop
    assert_equal 102_334_155, @fib.loop(40)
  end

  def test_large_number_general_term
    assert_equal 102_334_155, @fib.general_term(40)
  end
end

class Fibonacci
  def self.loop(number)
    a = 0
    b = 1
    c = 0
    (0...number).each do |i|
      a = b
      b = c
      c = a + b
    end
    c
  end

  def self.general_term(number)
    a = ((1 + Math.sqrt(5)) / 2)**number
    b = ((1 - Math.sqrt(5)) / 2)**number
    ((a - b) / Math.sqrt(5)).round
  end
end

class FibonacciRecursive
  def exec(number, memo={})
    return 0 if number.zero?
    return 1 if number == 1

    memo[number] ||= exec(number - 1, memo) + exec(number - 2, memo)
  end
end