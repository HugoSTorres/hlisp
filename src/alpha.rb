class Alpha
  attr_reader :value

  def initialize(code)
    @value = code
  end

  def self.evaluate(code)
    /^\w*[a-zA-Z]\w+$/ === code ? Alpha.new(code) : false
  end
end
