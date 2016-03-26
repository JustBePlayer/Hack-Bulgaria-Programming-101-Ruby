class Polynome

	include Enumerable

	def initialize(polynomial)
		@polynomial = polynomial.split("+")
		@monom_list = add_monom.sort { |a, b|  a.degree <=> b.degree }.reverse
		simple_if_possible!
		puts @monom_list[0].coef
	end

	def add_monom
		coef, degree, index = 1, 0, 0

		[].tap do |result|
			@polynomial.each do |str|
				coef = str.chars.take_while{|chr| is_positive_digit? chr}
					.join('')
					.to_i
				coef = 1 if str.split('').first == "x"
				if str.split('').last == "x"
					coef = 1 
					degree = 1
				elsif coef.to_s.length == str.length
					degree == 0
				else
					degree = str.reverse.chars.take_while { |chr| is_positive_digit? chr}
					.reverse
					.join('')
					.to_i
				end
			
				result << Monom.new(coef, degree).do_it
			end
		end
	end

	def each(&block)
		@monom_list.each(&block)
	end

	def to_s
		result = []
		@monom_list.each do |item|
			next if item.coef < 1
			monom_str = item.coef.to_s 
			monom_str += "x" if item.degree > 0
			monom_str += "^#{item.degree}" if item.degree > 1
			result << monom_str
		end
		return result.join('+') if result.any?
		"0"
	end

	private

	def is_positive_digit?(n)
		123_456_789_0.to_s.chars.include? n
	end

	def simple_if_possible!
		each.each_cons(2) do |element, next_element|
			next unless element.degree == next_element.degree
			next_element = Monom.new(element.coef + next_element.coef, element.degree)
			puts next_element.coef
			@monom_list.delete(element)
		end
	end

end

class Monom

	attr_accessor :coef
	attr_accessor :degree

	def initialize(coef, degree)
		@coef = coef
		@degree = degree
	end

	def do_it
		Monom.new(coef, degree).tap do |monom|
			monom.coef = coef * degree
			monom.degree = degree > 0 ? degree - 1 : 0
		end
	end

	private

	def sort_by

	end
end