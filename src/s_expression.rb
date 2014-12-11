class SExpression
  attr_reader :value

  def initialize(code)
    unless (@value = Atom.new code)
      @value = Sequence.new(code).tokenize.set_execution_order
    end
  end
end

