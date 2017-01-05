class SingleLinkedList

  attr_accessor :head

  def initialize
    @head = Node.new
  end

  class Node
    attr_accessor :key, :next_node

    def initialize(key: nil, next_node: nil)
      @key = key
      @next_node = next_node
    end
  end

  def push_front(value)
    old_head = head.next_node
    head.next_node = Node.new(key: value, next_node: old_head)
    self
  end

  def pop_front
    old_head = head.next_node
    head.next_node = old_head.next_node
    old_head.next_node = nil
    old_head
  end

  def last_two_node
    node, next_node = head, head.next_node

    while next_node && next_node.next_node
      node = next_node
      next_node = next_node.next_node
    end

    [node, next_node]
  end

  def push_back(value)
    last_two_node.compact.last.next_node = Node.new(key: value)
    self
  end

  def pop_back
    node, last_node = last_two_node
    node.next_node = nil
    last_node
  end

  def find(value)
    node = head
    (node = node.next_node) while node && node.key != value
    node ? node : "Cannot find #{value} in the list"
  end

  def to_s
    values, node = ["head"], head.next_node

    while node
      values << node.key
      node = node.next_node
    end

    values.join("-->")
  end
end
