require 'pry'

class Atom
  attr_reader :value

  def initialize(code)
    @value = case code
    when "nil", "F"
      nil
    when "T"
      true
    else
      ret = Alpha.evaluate code
      if ret == false
        Number.evaluate code
      else
        ret
      end
    end
  end
end
