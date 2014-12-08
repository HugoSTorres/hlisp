class Sequence
  attr_reader :value

  def initialize(code)
    @value = code
  end

  def tokenize
    Sequence.new @value.sub(/\(/, " ( ").sub(/\)/, " ) ").split
  end

  def parse
    parens = 0
    ret = []

    @value.each do |token|
      case token
      when "("
        parens += 1
        ret << token
      when ")"
        parens -= 1
        ret << token
      else
        ret << Atom.evaluate(token).value
      end
    end

    ret
  end

  private

    # check sequence's parenthetical validity
    def check_parenthesis_in(code)
      paren_count = 0

      return false unless code[0] == '(' && code[code.length - 1] == ')'

      code.each_char do |c|
        paren_count = paren_count + 1 if c == '('
        paren_count = paren_count - 1 if c == ')'
      end

      paren_count == 0 ? true : false
    end
end
