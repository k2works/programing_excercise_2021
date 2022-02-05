require 'minitest/reporters'
Minitest::Reporters.use!
require 'minitest/autorun'
 
class FiboTest < Minitest::Test
 
  def test_syori
    assert_equal 1, Sample.syori(1)
  end
 
  def test_syori1
    assert_equal 1, Sample.syori(2)
  end
 
  def test_syori3
    assert_equal 2, Sample.syori(3)
  end
 
  def test_syori4
    assert_equal 55, Sample.syori(10)
  end
 
end
 
class Sample
  def self.syori(num)
      array = []
      for w in 1..num
        if w <= 2
          array[w] = 1
        else
          array[w] = array[w-1] + array[w-2]
        end
      end
      p array[w]
      return array[w]
 
  end
end
