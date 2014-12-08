class Atom
  attr_reader :value

  def initialize(nonterminal)
    @value = nonterminal
  end

  def self.evaluate(code)
    unless (nonterminal = Number.evaluate code)
      nonterminal = Alpha.evaluate code
    end

    Atom.new nonterminal
  end
end
