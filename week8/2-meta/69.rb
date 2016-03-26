

class Fixnum
  alias_method :old_method, :*
  def *(other)
  	return 42 if (self == 9 and other == 6) or (self == 6 and other == 9)
  	self.old_method(other)
  end
end
