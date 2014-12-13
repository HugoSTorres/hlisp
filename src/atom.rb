# Class representing an atom.
class Atom
  attr_reader :value

  # Since an atom can only be an alphanumeric or a pure number, we initialize it
  # that way. T and nil are special atoms and are treated like the real Ruby
  # true and nil types, instead of checking them at run-time.
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
