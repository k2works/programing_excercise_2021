# frozen_string_literal: true

require 'minitest/reporters'
Minitest::Reporters.use!
require 'minitest/autorun'

class FibonacciTest < Minitest::Test
  def setup
    @recursive = Fibonacci.new(FibonacciRecursive.new)
    @loop = Fibonacci.new(FibonacciLoop.new)
    @general_term = Fibonacci.new(FibonacciGeneralTerm.new)
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
    assert_equal 102_334_155, @loop.exec(40)
  end

  def test_large_number_general_term
    assert_equal 102_334_155, @general_term.exec(40)
  end

  def test_invalid_number
    result = assert_raises RuntimeError do
      @recursive.exec(-1) 
    end
    assert_equal 'マイナスの値は指定できません', result.message
  end
end

class Fibonacci
  def initialize(algorithm)
    @algorithm = algorithm
  end

  def exec(number)
    raise RuntimeError.new('マイナスの値は指定できません') if number < 0
    @algorithm.exec(number)
  end
end

class FibonacciRecursive
  def exec(number, memo={})
    return 0 if number.zero?
    return 1 if number == 1

    memo[number] ||= exec(number - 1, memo) + exec(number - 2, memo)
  end
end

class FibonacciLoop
  def exec(number)
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
end

class FibonacciGeneralTerm
  def exec(number)
    a = ((1 + Math.sqrt(5)) / 2)**number
    b = ((1 - Math.sqrt(5)) / 2)**number
    ((a - b) / Math.sqrt(5)).round
  end
end