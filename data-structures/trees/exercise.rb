class BinaryTreeNode

  attr_accessor :value
  attr_reader :left, :right

  def initialize(value)
    @value = value
    @left  = nil
    @right = nil
  end

  def insert_left(value)
    @left = BinaryTreeNode.new(value)
  end

  def insert_right(value)
    @right = BinaryTreeNode.new(value)
  end
end

# A tree is "superbalanced" if the difference
# between the depths of any two leaf nodes is no greater than one.

def leaf_node?(tree_node)
  tree_node.left.nil? && tree_node.right.nil?
end

def get_leaf_node_depthes(tree_node, result, depth)
  if leaf_node?(tree_node)
    return result << depth
  end

  if tree_node.left
    get_leaf_node_depthes(tree_node.left, result, depth+1)
  end

  if tree_node.right
    get_leaf_node_depthes(tree_node.right, result, depth+1)
  end
end

def balanced?(tree_root)
  leaf_node_depthes = get_leaf_node_depthes(tree_root, [], 0).sort
  (leaf_node_depthes.last - leaf_node_depthes.first) <= 1
end

def get_values(root, result)
  if root.left
    get_values(root.left, result)
  end

  result << root.value

  if root.right
    get_values(root.right, result)
  end

  result
end

def binary_search_tree?(root)
  values = get_values(root, [])
  values.sort === values
end
