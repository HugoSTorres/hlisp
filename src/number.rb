# Class representing a number.
class Number
  attr_reader :value

  def initialize(code)
    @value = code.to_i
  end

  # Check for number by matching to a regular expression.
  # If the input isn't a number, just return false (this helps in initalizing
  # an Atom).
  def self.evaluate(code)
    /^\d+$/ === code ? Number.new(code) : false
  end
end
