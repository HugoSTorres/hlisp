class Sequence
  attr_reader :value

  def initialize(code)
    @value = code
  end

  def self.evaluate(code)
    paren_count = 0

    code.each_char do |c|
      paren_count = paren_count + 1 if c == '('
      paren_count = paren_count - 1 if c == ')'
    end

    paren_count == 0 ? Sequence.new(code) : false
  end
end
