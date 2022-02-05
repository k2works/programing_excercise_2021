require 'minitest/reporters'
Minitest::Reporters.use!
require 'minitest/autorun'
 
class FibTest < Minitest::Test
    describe 'fibtests' do
        def setup
            @fib = Fib::Sequence
        end
 
        def test_1_to_1
            assert_equal [1], @fib.generate(1)
        end
 
        def test_2_to_1
            assert_equal [1,1], @fib.generate(2)
        end
 
        def test_5_to_11235
            assert_equal [1,1,2,3,5], @fib.generate(5)
        end
    end
end

class MainLoop
    def initialize
    end
 
    def run
        while Flag.loop? do
            Fibonacci.new.run
        end
    end
end

class Fibonacci
    def run
        Messages::Message.put("start")
        user_gets = User.get
        if user_gets[0] == 0
            fib = Fib::Sequence.generate(user_gets[1])
            Printer::Array.put(fib)
        elsif user_gets[1] == "end"
            Flag.loop_end
        else Messages::Message.put(user_gets[1]) end
    end
end

module Fib
	module Sequence
	    def self.generate(u_g)
		# (1..u_g).each.with_index.inject [] do |fib, (term, i)|
		#     if term <= 2
		#         fib << 1
		#     else fib << fib[i-2] + fib[i-1] end
		# end
		if u_g == 1 then [1]
		else (0..u_g-3).inject([1,1]) {|fib, i| fib << fib[i] + fib[i+1]} end
	    end
	end
    end
    
    module Printer
	module Array
	    def self.put(ary)
		fib_s = []
		max_dgt = Digit.check(ary.last)
		ary.each.with_index(1) do |term, i|
		    if i % 10 == 0
			fib_s << term.to_s + "\n"
		    else
			td = Digit.check(term)
			dgt_diff = max_dgt - td
			fib_s << term.to_s + "  "
			(1..dgt_diff).each { |i| fib_s << " " }
		    end
		end
		print fib_s.join
	    end
	end
    end

    module User
	def self.get
	    user_gets = gets.chomp
	    if user_gets =~ /[0-9]/
		[0, user_gets.to_i]
	    elsif user_gets == "end"
		[1, "end"]
	    else [1, "error"]
	    end
	end
    end

    module Flag
	attr_reader :flag
	@@flag = true
	def self.loop?; return @@flag; end
	def self.loop_end; @@flag = false; end
    end
     
    module Digit
	def self.check(num); num.abs.to_s.length; end
    end

    module Messages
	module Message
	    attr_reader :messages
     
	    # Store a messages in an List
	    MASSAGES = {
		"start" => "\n任意の項の数、フィボナッチ数列を表示します。\n希望する項の桁を入力してください。\n",
		"error" => "\n入力が正しくありません。\n"
	    }
     
	    def self.put(key); print MASSAGES[key]; end
	end   
end

main = MainLoop.new
main.run