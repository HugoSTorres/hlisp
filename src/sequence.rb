class Sequence
  attr_reader :value

  def initialize(code)
    @value = code
  end


  def self.evaluate(code)
    #return false unless check_parenthesis_in code

    # Arrays have stack methods, so we can use one as a stack by just sticking
    # to the stack methods.
    exec_stack = []
    roffset = 0
    length = code.length

    # Evaluating a sequence involves taking a chunk of code between
    # parenthesis and pushing it onto the stack. SExpression will take the
    # stack and pop each element off, evaluating it one at a time.
    code.each_char.with_index do |c, i|
      if c == '('
        code.reverse.each_char.with_index(roffset) do |d, j|
          if d == ')'
            roffset = j
          end
        end

        # push a new sequence onto the stack, trimmed of parenthesis
        exec_stack << Sequence.new(code[i, length - roffset])
      end
    end

    return exec_stack
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
