class Number
  attr_reader :value

  def initialize(code)
    @value = code.to_i if /^\d+$/ === code
  end
end
