class Points
	def initialize(x, y)
		@x = x
		@y = y
	end	

	def move_to_directions(direction_string)
		is_revesed = false
		 direction_string.each_char do |chr| 
		 puts chr 
		 	case chr
			when '>'
				@x += !is_revesed ? -1 : 1
			when '<'
				@x += !is_revesed ? 1 : -1
			when '^'
				@y += !is_revesed ? -1 : 1
			when 'v'
				@y += !is_revesed ? 1 : -1
			when '~'
				is_revesed = !is_revesed
			end
		end
		[@x, @y]
	end
end