class Hash
	def pick(*keys)
		result = {}
		keys.each do |item|
			result[item] = self[item] if has_key? item
		end
		result
	end

	def except(*keys)
		result = {}
		keys.each do |item|
			each { |self_key, self_value| result[self_key] = self_value unless self_value == item} 
		end
		result
	end

	def compact_values
		result = {}
		each { |key, value| result[key] = value unless value == false or value == nil}
		result
	end

	def defaults(hash)
		result = self
		hash.each { |key, value| result[key] = value unless result.has_key?(key) }
		result
	end

end