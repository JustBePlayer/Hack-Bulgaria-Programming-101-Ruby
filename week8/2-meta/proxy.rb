class Module
	class_eval do
		def method_missing(method_name, *args, **kwarg, &block)
			@elements.public_send(method_name.to_sym)
		end
	end
end



class Proxy
	def initialize(elements)
		@elements = elements
	end

	def respond_to_missing?(value, include_private = false)
		@elements.respond_to? value
	end

	def method_missing(method_name, *args, **kwarg, &block)
		@elements.public_send(method_name.to_sym, *args)
	end
end