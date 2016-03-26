class NumberSet

	include Enumerable

	def initialize(number = nil)
		@collection = []
		@collection << number unless number == nil
	end
	attr_accessor :collection

	def each(&block)
      @collection.each(&block)
    end

	def <<(element)
		@collection.push element unless @collection.include? element
	end

	def get(index)
		@collection[index]
	end

	def size
		@collection.length
	end

	def empty?
		!@collection.any?
	end

	def [](element)
		##
		#result = NumberSet.new
		#puts element.class
		#result.collection = select { |value| element.satisfy?(value) }
		#result
		##
		NumberSet.new.tap do |result|
			result.collection = select { |value| element.satisfy?(value) }
		end
	end

	def to_a
		collection
	end
end

module Filterable
	def &(other)
		Filter.new do |number|
			self.satisfy?(number) and other.satisfy?(number)
		end 
	end

	def |(other)
		Filter.new do |number|
			self.satisfy?(number) or other.satisfy?(number)
		end
	end
end

class Filter

	include Filterable
	def initialize(&block)
		@filter_block = block
	end

	def satisfy?(x)
		@filter_block.call(x)
	end
end

	class TypeFilter
		include Filterable

		def initialize(param)
			@param = param
			@types = {
				:integer => Integer,
				:real => Float,
				:complex => Complex
			}
			
			def satisfy?(x)
				x.is_a?(@types[@param])
			end
		end

		def satisfy?(x)
			case @param
			when :positive
				x > 0
			end
		end
	end

	class SignFilter
		include Filterable
		def initialize(param)
			@param = param
		end

		def satisfy?(x)
			case @param
			when :positive
				x > 0
			when :non_negative
				x >= 0
			when :negative
				x < 0
			when :non_positive
				x <= 0
			end
		end

	end

