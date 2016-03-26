class  Object
	def singleton_class
		class << self
			self
		end
	end

	class << self
		def define_singleton_method(name, &block)
			 define_method name.to_sym, &block
		end


	end
end


#######String to Proc#######

class String
		def to_proc
			
			Proc.new do |arg, *args|
				self.split('.').each do |el|
					arg = arg.send(el.to_sym, *args)
				end
				arg
			end
			

			
			#proc {|arg, *args| x.first.public_send(self.to_sym, *x.drop(1))}
			#proc {|arg| arg.public_send(self.to_sym)}


			#eval  "proc { " + self + " }"
		end
end


class Module
	def cattr_accessor(symbol,&block)
		cattr_reader(symbol)
		cattr_reader(symbol)
	end

	def cattr_reader(symbol)
		@@symbol = symbol
		class << self
			attr_reader @@symbol
		end
	end

	def cattr_writer(symbol)
		@@symbol = symbol
		class << self
			attr_writer @@symbol
		end
	end

	def private_attr_accessor(symbol)
		self.class_eval do
			private
			attr_reader symbol
			attr_reader symbol
		end
	end
end

class TestClass
	private_attr_accessor(:test)
	cattr_accessor(:foo){[]}
end

TestClass.foo

