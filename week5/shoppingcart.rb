module Prommo
	def get_one_free(quantity)
		((quantity / self.promo.values.first.to_i).to_d * self.price).to_f
	end

	def package(quantity)
		n_pack = self.promo.values.first.keys.first
		n_promo = self.promo.values.first.values.first
		ShoppinCart.sum(self.price, quantity / n_pack) * n_promo / 100
	end

	def threshold(quantity)
		thr_pack = self.promo.values.first.keys.first
		thr_promo = self.promo.values.first.values.first
		return ShoppinCart.sum(self.price, quantity - thr_pack) if quantity > thr_pack
	end

	def promo_string
		key = self.promo.keys.first
		#puts key

		case key
		when :get_one_free
			puts key
			"(buy #{self.promo[key] - 1}, get 1 free)"
		when "package"
			p_key = self.promo[key].keys.first
			"(get #{self.promo[key][p_key]}% off for every #{p_key})"
		when "threshold"
			t_key = self.promo[key].keys.first
			"(#{self.promo[key][t_key]}% off every after the #{t_key})"
		end
	end
end

class Inventory
	def initialize()
		@storage = [], []
	end

	def register(name, price, promo = nil)
		@storage << Product.new(name, price, promo)
	end

	def new_cart
		ShoppingCart.new(self)
	end

	def contain?(x)
		return true if @storage.any? { |product| product.name == x }
		false
	end

	def self.input
		inventory = Inventory.new

    inventory.register 'Green Tea', '1.99'
    inventory.register 'Red Tea',   '2.49'
    inventory.register 'Earl Grey', '1.49'
    inventory
	end

	def get_product(name)
		@storage.find { |product| product.name == name }
	end

	def length
		@storage.length
	end

	def register_coupon(name, hash)
		@coupons << Coupon.new(name, hash.keys.first, hash.values.first)
	end

	def select_coupon(name)
		@coupons.find {|coupon| coupon.name == name}
	end

	def each_coupon(&block)
		@coupons.each
	end

end
class Product

	require 'bigdecimal'
	require 'bigdecimal/util' # добавя String#to_d

	attr_reader :name
	attr_reader :price
	attr_reader :promo

	include Prommo

	def initialize(name, price, promo = nil)
	raise RuntimeError.new("Invalid parameters parsed") unless valid?(name, BigDecimal(price.to_s))
		@name = name
		@price = BigDecimal(price.to_s)
		@promo = promo
		puts @price
	end

	def valid?(name, price)
		return true if name.length < 40 and (price > BigDecimal('0.01') and price < BigDecimal('999.99'))
		#return true if name.length < 40 and (price > 0.01 and price < 999.99)
		false
	end
	
end

class ShoppingCart
	include Enumerable

	require "terminal-table"

	def initialize(inventory)
		@products = {}
		@inventory = inventory
		@coupons = [0.to_d]
	end

	def each(&block)
		@products.each(&block)
	end

	def add(name, quantity = 1)
		raise ArgumentError if !@inventory.contain?(name)
		rescue
			"This product doesn't exist in this inventory"
		else
			product = @inventory.get_product(name)
			if contain?(product)
				@products[product] += quantity
			else
				@products[product] = quantity
			end
	end

	def invoice
		invoice = Terminal::Table.new do |t|
			promos = []
			each do |product, quantity|
				t << to_a(product, quantity)
				next if product.promo.nil?

				promo = product.promo.keys.first.to_sym
				promo_val = product.public_send(promo, quantity)
				t << [].tap do |arr|
					arr << { :value => product.promo_string, :alignment => :center}
					arr << " "	
					arr << '-' + promo_val.to_s
				end
				promos << promo_val.to_d

			end
		end
		@inventory.each_coupon do |coupon|
			invoice.add_row [{:value => coupon.string, :alignment => :center}, " ", -coupons.use(total)]
		end
		invoice.headings = ["Product", "Quantity", "Price"]
		invoice.title = "Invoice"
		invoice.style = { :width => 80 }
		invoice.add_separator
		invoice.add_row ["Total", " ", total.to_f]
		puts invoice
	end

	#def to_a
	#	rows = [].tap do |arr|
	#		each do|product, quantity|
	#			arr << [].tap do |element|
	#				element.concat([product.name, quantity, sum(product.price, quantity)])
	#			end	
	#		end	
	#	end
	#end

	def to_a(product, quantity)
		[product.name, quantity, ShoppingCart.sum(product.price, quantity)]
	end


	def contain?(product)
		return true if select {|k,_| k == product}.to_a.any?
		false
	end

	def total
		result, promos = 0.to_d, [0]
		each do |product, quantity|
			result += product.price * quantity
			next if product.promo.nil?
			promos << product.public_send(product.promo.keys.first.to_s, quantity)
		end
		(result - promos.reduce(:+)) - @coupons.reduce(:+)
	end

	def self.sum(price, quantity)
		(price * quantity.to_d).to_f
	end

	def use(name)
		coupon = @inventory.select_coupon(name)
		raise "Undefined coupon. Please try again" if coupon.nil?
		@coupons << coupon.use(total) 
	end
end

class Coupon

	require 'bigdecimal'
	require 'bigdecimal/util' # добавя String#to_d

	attr_reader :name

	def initialize(name, type, discount)
		@name = name
		@type = type
		@discount = discount
	end

	def use(price)
		public_send(@type.to_sym, price)
	end

	def string
		str = "Coupon #{@name} - "
		case @type
		when :percent
			str + "#{discount.to_f}% off"
		when :amount
			str + "amount: #{discount.to_f}"
		end
	end

	def percent(value)
		(value * @discount) / 100 
	end

	def amount(value)
		return value - discount.to_d if value >= discount.to_d
		0
	end
	
end
