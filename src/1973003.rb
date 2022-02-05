require 'minitest/reporters'
Minitest::Reporters.use!
require 'minitest/autorun'
 
class SuretsuTest < Minitest::Test
    describe 'Suretsu' do
      def setup
        @suretsu = Suretsu
      end
 
      describe '１を表示する' do
        def test_1を渡したら1を返す
          assert_equal 1,@suretsu.num(1)
        end
      end
      describe '１を表示する' do
        def test_2を渡したら1を返す
          assert_equal 1,@suretsu.num(2)
        end
      end
      describe '8を表示する' do
        def test_6を渡したら8を返す
          assert_equal 8,@suretsu.num(6)
        end
      end
    end
end
class Suretsu
  def self.num(n)
    array_fibonacci = Array.new
    array_fibonacci[0] = array_fibonacci[1] = 1
    for i in 2..n
      tmp = array_fibonacci[i - 1] + array_fibonacci[i - 2]
      array_fibonacci.push(tmp)
    end
      return array_fibonacci[n-1]
  end
end

puts "どこまでの配列を出したいかを入力してください"
dainyu = gets.to_i
while dainyu < 1
  puts "数は、1以上をいれてください"
  dainyu = gets.to_i
end

for i in 1..dainyu
kekka = Suretsu.num(i)
puts  i.to_s + "個目のフィボナッチ数列は" + kekka.to_s + "です。"
end