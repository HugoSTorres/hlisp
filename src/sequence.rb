require 'pry'

class Sequence
  attr_reader :value

  def initialize(code)
    @value = code
  end

  def tokenize
    ret = []

    @value.gsub(/\(/, " ( ").gsub(/\)/, " ) ").split.each do |token|
      case token
      when "(", ")"
        ret << token
      else
        ret << Atom.new(token).value
      end
    end

    Sequence.new ret
  end

  def set_execution_order
    _set_execution_order = lambda do |tokens, ret = []|
      token = tokens.delete_at 0

      case token
      when "("
        ret << _set_execution_order[tokens]
      when ")"
        ret
      else
        ret << token
        _set_execution_order[tokens, ret]
      end
    end

    Sequence.new _set_execution_order[@value]
  end

  private

    # check sequence's parenthetical validity
    def missing_parenthesis_in(code)
      return true unless code[0] == '(' && code[code.length - 1] == ')'
    end

    def balanced_parenthesis
      paren_count = 0

      code.each_char do |c|
        paren_count = paren_count + 1 if c == '('
        paren_count = paren_count - 1 if c == ')'
      end

      paren_count == 0 ? true : false
    end
end
