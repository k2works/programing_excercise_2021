require 'minitest/reporters'

Minitest::Reporters.use!

require 'minitest/autorun'

def fibonacci(num)
  if num == 0

    0

  elsif num == 1

    1

  else

    fibonacci(num - 1) + fibonacci(num - 2)

  end
end

(0..30).each do |i|
  puts "第 #{i} 項: #{fibonacci(i)}"
end
