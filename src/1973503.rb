class Fibo
	def self.num(n)
	  if n == 0 or n == 1
	    return n
	else
	    return num(n - 2) + num(n - 1)
	  end
	end
      end
      