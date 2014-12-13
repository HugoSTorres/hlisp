# Class representing an s-expression.
class SExpression
  attr_reader :value

  # Since an s-expression can only be an atom or a sequence, we initialize it as
  # either an Atom or a Sequence.
  def initialize(code)
  	val = Atom.new code

  	if val.value == false
  		@value = Sequence.new(code).tokenize.set_execution_order
  	else
  		@value = val
  	end
  end
end
