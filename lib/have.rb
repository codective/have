require "have/version"

module Have
  def has? arg
    result = self.send(arg)
    result && result != ''
  end
end

class Object
  include Have
end
