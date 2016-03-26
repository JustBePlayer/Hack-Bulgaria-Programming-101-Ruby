class Array
  def to_hash
		hash = {}
		each do |element|
			#hash.delete_if { |key, value| key == element[0] }
			hash[element[0]] = element[1]
		end
		hash
	end

	def index_by
		hash = {}
		each do |element|
			hash[yield(element)] = element
		end
		hash
	end

	def subarray_count arr
		count = 0 
		each_cons(arr.length) {|n| count +=1 if n == arr } #Проверява всеки 2 елемента на масива [1,2], [2,3] или н [n1,n2...nm]
		count
	end

	def occurences_count
		hash = {}
		each {|n| hash[n] = self.count(n) }
		hash
	end
end
