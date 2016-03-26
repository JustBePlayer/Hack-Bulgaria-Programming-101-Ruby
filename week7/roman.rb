module Roman
	def self.const_missing(const)
		hash = {
			"I" => 1,
			"V" => 5,
			"X" => 10,
			"L" => 50,
			"M" => 100
		}
		#first_element = const.to_s.reverse.chars.first
		new_arr = hash[const.to_s.chars[0]] > hash[const.to_s.chars[1]] ? const.to_s.chars : const.to_s.reverse.chars
		first_element = new_arr.first
		puts first_element


		if const.to_s.length > 3
			const.to_s.reverse.chars.drop(1).each_cons(2) do |chr_pair|
				raise "Invalid" if chr_pair.uniq.length == 1
			end
		end
		#return const.to_s.chars.reduce {|sum, n| sum + hash[n]} #if const.to_s.chars.uniq.length == 1
		if const.to_s.chars.uniq.length == 1
			const.to_s.chars.each { |el| sum += hash[el] }
			return sum
		end

		digit = hash[first_element]
		puts digit
		const.to_s.reverse.chars.drop(1).each do |element|
			digit -= hash[element]
		end
		digit
	end
end

module Roman1
	def self.const_missing(const)
		hash = {
			"I" => 1,
			"V" => 5,
			"X" => 10,
			"L" => 50,
			"M" => 100
		}

		arr, sum = const.to_s.chars, hash[const.to_s.chars.first]
		if arr.length > 3
			arr.reverse.each_cons(4) do |chr_pair|
				raise "Invalid" if chr_pair.uniq.length == 1
			end
		end

		arr.each_cons(2) do |first, last|
			#sum += hash[first] < hash[last] ? -(hash[last]) : hash[last]
			if hash[first] < hash[last] 
				sum = -sum + hash[last]
			else
				sum += hash[last]
			end
		end
		sum

	end
end