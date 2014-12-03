class Number
  attr_reader :value

  def initialize(code)
    @value = code.to_i
  end

  def self.evaluate(code)
    /^\d+$/ === code ? Number.new(code) : false
  end
end
