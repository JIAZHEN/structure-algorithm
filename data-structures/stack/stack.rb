class Stack
  attr_reader :stack, :min_value

  def initialize
    @stack = []
  end

  def min_indices
    @min_indices ||= []
  end

  def pop
    min_indices.pop if (@stack.size - 1) == min_indices.last
    @stack.pop
  end

  def push(value)
    @stack.push(value)
    if min_value.nil? || min_value > value
      min_indices.push(@stack.size - 1)
    end
    self
  end

  def top
    @stack.last
  end

  def min_value
    @stack.at(min_indices.last) unless min_indices.empty?
  end
end
