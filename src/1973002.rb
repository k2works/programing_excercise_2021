require 'minitest/reporters'
Minitest::Reporters.use!
require 'minitest/autorun'
 
class Mojiretutest < Minitest::Test
    describe 'Mojiretu' do
        def setup
            @Fi =Fibo.new
        end
 
        describe '引数が１の場合' do
		def test_1を渡したら1を返す
			assert_equal 1, @Fi.koumoku(1)
		    end
		end
		describe '引数が3の場合' do
		    def test_3を渡したら2を返す
			assert_equal 2, @Fi.koumoku(3)
		    end
		end
		describe '引数が7の場合' do
		    def test_7を渡したら13を返す
			assert_equal 13, @Fi.koumoku(7)
		    end
		end
		describe '引数が-1の場合' do
		    def test_マイナス1を渡したらエラー文を返す
			assert_equal "計算できなく、範囲オーバーです", @Fi.koumoku(-1)
		    end
		end
	    end
	end

	class Fibo
		def koumoku(bango)
		    num = []
		    num[1] = 1
		    num[2] = 1
		    if bango<=0
			return "計算できなく、範囲オーバーです"
		    end
		    if bango==1 || bango==2
			return 1
		    end
			(3..bango).each do |i|
			num[i] = num[i-1] + num[i-2]
			    if bango==i
				return num[i]
			    end
			end
		end
	     
	    end
	    
	    @Fi =Fibo.new
	    print "数値を入力してください："
	    suti=gets.to_i
	    suti.times do |i|
	    puts @Fi.koumoku(i+1)
	    end
	    