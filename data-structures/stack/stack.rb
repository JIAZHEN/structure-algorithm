class Stack
  attr_reader :stack, :min_value

  def initialize
    @stack = []
  end

  def min_stack
    @min_stack ||= []
  end

  def pop
    value = @stack.pop
    if value == min_value
      min_stack.pop
      @min_value = min_stack.top
    end
    value
  end

  def push(value)
    if min_value > value
      min_stack.push(value)
      @min_value = value
    end
    @stack.push(value)
    self
  end

  def top
    @stack.last
  end
end
