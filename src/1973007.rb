require 'minitest/reporters'
Minitest::Reporters.use!
require 'minitest/autorun'
 
class FibonattiTest < Minitest::Test
    def test_1を渡したら1を返す
        assert_equal 1, Fibonatti.fibonatti_list(1)
    end
 
    def test_2を渡したら1を返す
        assert_equal 1, Fibonatti.fibonatti_list(2)
    end
 
    def test_3を渡したら2を返す
        assert_equal 2, Fibonatti.fibonatti_list(3)
    end
 
    def test_10を渡したら55を返す
        assert_equal 55, Fibonatti.fibonatti_list(10)
    end
end

class Fibonatti
	@list = []
	@list[1] = 1
	@list[2] = 1
     
	def self.fibonatti_list(kazu)
	    if kazu == 1
		return @list[1]
     
	    elsif kazu == 2
		return @list[2]
     
	    else
		print "1 1 "
     
		for i in 3..kazu
		    @list[i] = @list[i-1] + @list[i-2]
		    print "#{@list[i]} "
		end
     
		return @list[kazu]
	    end
	end
    end
    