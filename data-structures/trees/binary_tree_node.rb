class BinaryTreeNode

  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
  end

  def insert(v)
    case value <=> v
    when 1 then insert_left(v)
    when -1 then insert_right(v)
    end
  end

  def find(v)
    case value <=> v
    when 1 then left.find(v)
    when -1 then right.find(v)
    else self end
  end

  def path(v, array = [])
    case value <=> v
    when 1
      left.path(v, array + [v])
    when -1 then right.find(v)
    else self end
  end

  private

  def insert_left(v)
    if self.left
      self.left.insert(v)
    else
      self.left = BinaryTreeNode.new(v)
    end
  end

  def insert_right(v)
    if self.right
      self.right.insert(v)
    else
      self.right = BinaryTreeNode.new(v)
    end
  end
end
