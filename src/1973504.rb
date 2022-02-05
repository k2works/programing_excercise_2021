require 'minitest/reporters'
Minitest::Reporters.use!
require 'minitest/autorun'



class SuuretuTest < Minitest::Test
 
    def test_syori1
        assert_equal 1 , Suuretu.syori(1)
       
    end
      def test_syori2
        assert_equal 1 , Suuretu.syori(2)
    end
      def test_syori3
        assert_equal 2 , Suuretu.syori(3)
    end
    def test_syori7
        assert_equal 13 , Suuretu.syori(7)
    end
end
 
 class Suuretu
   
      def self.syori(no)
    array_fibonatti=[]
    array_fibonatti[1]=1
    array_fibonatti[2]=1
    if no==1||no==2
        return 1
    end
 
            (3..no).each do |i|
                array_fibonatti[i]  = array_fibonatti[i - 1] + array_fibonatti[i - 2]
            end
            return array_fibonatti[no]
 
        
    end
end
