User = Struct.new(:first_name, :last_name)


class Module
	def delegate(name, to:)
		define_method(name) do
			instance_eval(to.to_s).send(name)
		end
	end
end
class Invoce
  delegate :first_name, to: '@user'
  delegate :last_name, to: '@user'

  def initialize(user)
    @user = user
  end
end

