require_relative "../linked-list/single_linked_tail_list"

class QueueDataStructure < SingleLinkedTailList
  def enqueue(value)
    push_back(value)
  end

  def dequeue
    pop_front
  end

  def empty?
    self.tail == self.head
  end
end
