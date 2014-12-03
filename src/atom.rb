class Atom
  attr_reader :value

  def initialize(code)
    unless (@value = Number.evaluate code)
      @value = Alpha.evaluate code
    end
  end
end
