class SExpression
  attr_reader :value

  def self.evaluate
    unless (@value = Atom.evaluate code)
      @value = Sequence.new(code).tokenize.set_execution_order
    end
  end
end

