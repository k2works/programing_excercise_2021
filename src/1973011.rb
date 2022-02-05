require 'minitest/reporters'
Minitest::Reporters.use!
require 'minitest/autorun'
 
class FibonatchiTest < Minitest::Test
    describe 'Fibonatchi' do
        def test_F
            assert_equal 1,Fibonatchi.calc
        end
 
        def test_S_1
            assert_equal [1],Fibonatchi.calc(1)
        end
 
        def test_S_2
            assert_equal [1,1],Fibonatchi.calc(2)
        end
 
        def test_T
            assert_equal [1,1,2,3,5,8,13,21,34,55],Fibonatchi.calc(10)
        end
    end
end
 
class Fibonatchi
    def self.calc(n)
        fib = []
        for i in 1..n
            if i == 1 || i ==2
                fib << 1
                else
                    fib << fib[i-3] + fib[i-2]
            end
        end
        return fib
    end
end
