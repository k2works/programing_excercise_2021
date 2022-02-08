# frozen_string_literal: true

require 'minitest/reporters'
Minitest::Reporters.use!
require 'minitest/autorun'

class FibonacciTest < Minitest::Test
  describe '正常系' do
    def setup
      @fib = Fibonacci
    end

    def test_fibonacci
      cases = [[0,0],[1,1],[2,1],[3, 2],[4,3],[5, 5]]
      cases.each do |input, expected|
        assert_equal expected, @fib.calc(input)
      end
    end

    def test_large_number
      assert_equal 102_334_155, @fib.calc(40)
    end
  end

  describe '異常系' do
    def setup
      @fib = Fibonacci
    end

    def test_マイナスの値はエラーを返す
      result = assert_raises(RuntimeError, 'マイナスの値は指定できません') do
        @fib.calc(-1)
      end
      assert_equal 'マイナスの値は指定できません', result.message
    end
  end
end

class Fibonacci
  def self.calc(number, memo={})
    raise RuntimeError, 'マイナスの値は指定できません' if number < 0
    return memo[number] if memo[number]
    return 0 if number ==0
    return 1 if number ==1
    memo[number] = calc(number-1, memo) + calc(number-2, memo) 
  end
end