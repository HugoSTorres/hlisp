# Tree structure used to create nested arrays representing evaluation order.
# It's not the complete data structure because we don't need all the
# functionality for this implementation.

class Node
  attr_accessor :parent, :children, :values
  def initialize
    @children = []
    @parent = nil
    @values = []
  end

  def add_child(child)
    child.parent = self
    @children << child
  end

  def add_value(value)
    @values << value
  end

  def to_a
    result = values.clone
    @children.each do |child|
      result << child.to_a
    end
    result
  end
end
