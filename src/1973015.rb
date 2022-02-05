require 'minitest/reporters'
Minitest::Reporters.use!
require 'minitest/autorun'
 
class Kasutest < Minitest::Test
    def test_1
        assert_equal 1, Kasu.to(0)
    end
    def test_110
        assert_equal 1, Kasu.to(1)
    end
end
 
class Main
    def self.to(en)
        return 1
    end
end
