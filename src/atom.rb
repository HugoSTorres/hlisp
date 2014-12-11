class Atom
  attr_reader :value

  def initialize(code)
    @value = case code
    when "nil", "F"
      nil
    when "T"
      true
    else
      Alpha.evaluate code unless Number.evaluate code
    end
  end
end
