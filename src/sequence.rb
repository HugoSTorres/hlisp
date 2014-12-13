require_relative 'exec_tree'

# Class representing a sequence.
class Sequence
  attr_reader :value

  def initialize(code)
    @value = code
  end

  # Separate each token in the sequence.
  # Returns a tokenized version of the sequence.
  def tokenize
    ret = []

    @value.gsub(/\(/, " ( ").gsub(/\)/, " ) ").split.each do |token|
      case token
      when "(", ")"
        ret << token
      else
        ret << Atom.new(token)
      end
    end

    Sequence.new ret
  end

  # Create a nested array representing the tokens in the order they are to be
  # executed.
  # Returns a nested version of the sequence.
  def set_execution_order
    _set_execution_order = lambda do |tokens, node|
      token = tokens.shift

      case token
      when nil
        return node
      when "("
        child = Node.new
        node.add_child(child)
        _set_execution_order[tokens, child]
      when ")"
        _set_execution_order[tokens, node.parent]
      else
        node.add_value(token)
        return _set_execution_order[tokens, node]
      end
    end

    root = Node.new
    _set_execution_order[@value, root]
    Sequence.new root.to_a[0]
  end

  private

    def missing_parenthesis_in(code)
      return true unless code[0] == '(' && code[code.length - 1] == ')'
    end

    # This is its own method because it has no way of knowing whether or not
    # the sequence starts and ends with parenthesis.
    def balanced_parenthesis
      paren_count = 0

      code.each_char do |c|
        paren_count = paren_count + 1 if c == '('
        paren_count = paren_count - 1 if c == ')'
      end

      paren_count == 0 ? true : false
    end
end
