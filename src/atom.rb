class Atom
  attr_reader :value

  def initialize(terminal)
    @value = terminal
  end

  def self.evaluate(code)
    unless (terminal = Number.evaluate code)
      terminal = Alpha.evaluate code
    end

    Atom.new terminal
  end
end
