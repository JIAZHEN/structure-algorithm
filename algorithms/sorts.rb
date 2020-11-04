class Sorts
  def self.bubble_sort(array)
    (0...array.size).each do |i|
      has_swap = false
      (i+1...array.size).each do |j|
        if array[i] > array[j]
          array[i], array[j] = array[j], array[i]
          has_swap = true
        end
      end

      break unless has_swap
    end
    array
  end

  def self.select_sort(array)
    (0...array.size).each do |i|
      smallest_idx = i

      (i+1...array.size).each do |j|
        if array[smallest_idx] > array[j]
          smallest_idx = j
        end
      end

      if smallest_idx != i
        array[i], array[smallest_idx] = array[smallest_idx], array[i]
      end
    end
    array
  end

  def self.insert_sort(array)
    (1...array.size).each do |i|
      tmp = array[i]
      j = i
      while j > 0 && tmp < array[j-1]
        array[j] = array[j-1]
        j -= 1
      end

      (array[j] = tmp) if j != i
    end
    array
  end

  def self.hell_sort(array)
    gap = array.length / 2
    while gap > 0
      (gap...array.length).each do |i|
        j = i
        while (j - gap >= 0 && array[j] < array[j - gap])
          array[j - gap], array[j] = array[j], array[j - gap]
          j -= gap
        end
      end
      gap = gap / 2
    end
    array
  end

  def self.merge_sort(array)
    return array if array.size < 2
    middle = array.size / 2
    left = self.merge_sort(array[0...middle])
    right = self.merge_sort(array[middle...array.size])
    self.merge_two(left, right)
  end

  def self.merge_two(left, right)
    result = []
    while left.size > 0 && right.size > 0
      left.first < right.first ? (result << left.shift) : (result << right.shift)
    end

    left.size > 0 ? (result + left) : (result + right)
  end

  def self.quick_sort(array)
    if k = array.shift
      left = quick_sort(array.select{|i| i <= k})
      right = quick_sort(array.select{|i| i > k})
      left + [k] + right
    else
      []
    end
  end
end
