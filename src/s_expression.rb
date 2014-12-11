class SExpression
  attr_reader :value

  def initialize(code)
  	val = Atom.new code

  	if val.value == false
  		@value = Sequence.new(code).tokenize.set_execution_order
  	else
  		@value = val
  	end
  end
end

