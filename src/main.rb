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
      cases = [[0,0],[1,1],[2,1],[3,2],[4,3],[5,5]]
      cases.each do |i|
        assert_equal i[1], @fib.calc(i[0])
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
      result = assert_raises RuntimeError do
        @fib.calc(-1)
      end
      assert_equal 'マイナスの値は無効です', result.message
    end
  end

end

class Fibonacci
  def self.calc(n, memo={})
    raise RuntimeError.new('マイナスの値は無効です') if n < 0    
    return 0 if n.zero?
    return 1 if n == 1
    memo[n] ||= calc(n - 1, memo) + calc(n - 2, memo)
  end
end