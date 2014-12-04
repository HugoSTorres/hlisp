class SExpression
  attr_reader :value

  def self.evaluate
    unless (@value = Atom.evaluate code)
      @value = Sequence.evaluate code
    end
  end
end

