# Module containing predefined functions, as well as a function table that holds
# all functions that have been defined by the user or that are registered with
# the interpreter from imported libraries.

module Function
  def function_table
    ['add', 'sub', 'mult', 'div']
  end

  def add(args)
    sum = args.shift

    args.each do |arg|
      sum += arg
    end

    sum
  end

  def sub(args)
    sum = args.shift

    args.each do |arg|
      sum -= arg
    end

    sum
  end

  def mult(args)
    product = args.shift

    args.each do |arg|
      product *= arg
    end

    product
  end

  def div(args)
    quotient = args.shift

    args.each do |arg|
      raise "Cannot divide by zero!" if arg == 0
      quotient \= arg
    end

    quotient
  end
end
