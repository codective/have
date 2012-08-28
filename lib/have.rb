require "have/version"

module Have
  def has? arg
    if respond_to? arg.to_s
      result = self.send(arg)
      result && result != ''
    else
      include? arg
    end
  end

  def has_any? *args
    args.any? { |arg| has? arg }
  end

  def has_all? *args
    args.all? { |arg| has? arg }
  end
end

class Object
  include Have
end
