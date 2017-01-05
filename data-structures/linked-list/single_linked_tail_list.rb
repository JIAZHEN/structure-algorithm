require_relative "single_linked_list"

class SingleLinkedTailList < SingleLinkedList
  attr_accessor :tail

  def initialize
    super
    @tail = self.head
  end

  def push_front(value)
    old_head = head.next_node
    new_node = Node.new(key: value, next_node: old_head)
    head.next_node = new_node
    self.tail = new_node if self.tail == self.head
    self
  end

  def pop_front
    old_head = super
    self.tail = self.head unless head.next_node
    old_head
  end

  def push_back(value)
    new_node = Node.new(key: value)
    self.tail.next_node = new_node
    self.tail = new_node
  end

  def pop_back
    node, last_node = last_two_node
    node.next_node = nil
    self.tail = node
    last_node
  end

  def to_s
    list_output = super
    list_output << ". Tail: (#{self.tail.key})"
  end
end
