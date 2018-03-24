class BinaryTreeNode

  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
  end

  def insert(v)
    case value <=> v
    when 1 then insert_to_left(v)
    when -1 then insert_to_right(v)
    end
  end

  def find(v)
    case value <=> v
    when 1 then find_from_left(v)
    when -1 then find_from_right(v)
    when 0 then self
    end
  end

  def path_for(v, array = [])
    case value <=> v
    when 1 then path_from_left(v, array + [value])
    when -1 then path_from_right(v, array + [value])
    when 0 then array + [value]
    end
  end

  def distance_between(value, another_value)
    if (node_path = path_for(value)) && (another_path = path_for(another_value))
      (
        (node_path | another_path) - (node_path & another_path)
      ).size
    end
  end

  def bfs
    queue, values = Queue.new.enq(self), []
    until queue.empty?
      node = queue.deq
      values << node.value
      queue << node.left if node.left
      queue << node.right if node.right
    end
    values
  end

  def dfs(type)
    self.send(type, self, [])
  end

  private

  %w(left right).each do |side|
    define_method("insert_to_#{side}") do |v|
      if self.public_send(side)
        self.public_send(side).insert(v)
      else
        self.public_send("#{side}=", BinaryTreeNode.new(v))
      end
    end

    define_method("find_from_#{side}") do |v|
      if self.public_send(side)
        self.public_send(side).find(v)
      end
    end

    define_method("path_from_#{side}") do |v, array|
      if self.public_send(side)
        self.public_send(side).path_for(v, array)
      end
    end
  end

  def inorder(node, values)
    return values unless node
    inorder(node.left, values)
    values << node.value
    inorder(node.right, values)
  end

  def preorder(node, values)
    return values unless node
    values << node.value
    preorder(node.left, values)
    preorder(node.right, values)
  end

  def postorder(node, values)
    return values unless node
    postorder(node.left, values)
    postorder(node.right, values)
    values << node.value
  end
end
