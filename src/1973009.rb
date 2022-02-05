class FibonacciSepuence
	# 入力された値番目の数値を返す関数
	def create(number)
	  # 入力された値が0以下ならエラーを返す
	  return 'error' if number <= 0
       
	  # 入力された値の要素数の数列を配列化し、最後の値を返す
	  createlist(number).last
	end
       
	# 入力された値を要素数とする数列の配列を返す関数
	def createlist(number)
	  # 初期値として1,1を記憶
	  list = [1, 1]
       
	  case number
	  # 1が入力されたら1を返す
	  when 1
	    [1]
	  # 2が入力されたら1，1を返す
	  when 2
	    [1, 1]
	  # 3以上が入力されたら数列を作成
	  when 3..nil
        # 初期値があるため、入力された値から2を引いた数の配列を作成
	(number - 2).times do |i|
		list << list[i] + list [i + 1]
	      end
	      list
	    # 入力された値が負の数ならエラーを返す
	    else
	      'input error'
	    end
	  end
	end
	    
	fibonacci = FibonacciSepuence.new
 
	puts 'フィボナッチ数列（入力された数値の個数出力）'
	switch = 0
	while switch.zero?
	  print '数値を入力 : '
	  number = gets.to_i
	  list = fibonacci.createlist(number)
	 
	  case list
	  when Array
	    list.length.times do |i|
	      puts "#{i+1}. #{list[i]}"
	    end
	  when String
	    puts list
	  end
	 
	  print '続けますか？(Yes:0,No:1) : '
	  switch = gets.to_i
	end
	 
	puts '終了しました。'	