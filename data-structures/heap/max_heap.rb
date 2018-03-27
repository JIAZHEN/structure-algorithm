class MaxHeap
  attr_accessor :array

  def initialize
    @array = Array.new
  end

  def insert(value)
    array.push(value)
    idx = array.size - 1
    while (parent_idx = parent_index_for(idx)) && array[parent_idx] < value
      swap(parent_idx, idx)
      idx = parent_idx
    end
  end

  def remove(value)
    idx = find(value)
    array[idx] = array.pop
    while true
      left, right = children_indices_for(idx)
      if array[left] && array[left] > array[idx]
        swap(left, idx)
        idx = left
      elsif array[right] && array[right] > array[idx]
        swap(right, idx)
        idx = right
      else
        break
      end
    end
  end

  def find(value)
    array.find_index(value)
  end

  private

  def children_indices_for(idx)
    [(2 * idx + 1), (2 * idx + 2)]
  end

  def parent_index_for(idx)
    idx.zero? ? 0 : ((idx - 1) / 2)
  end

  def swap(idx1, idx2)
    tmp = array[idx1]
    array[idx1] = array[idx2]
    array[idx2] = tmp
  end
end
