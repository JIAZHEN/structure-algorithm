class Array
  def bubble_sort
    (0...self.size).each do |i|
      has_swap = false
      (i+1...self.size).each do |j|
        if self[i] > self[j]
          tmp = self[i]
          self[i] = self[j]
          self[j] = tmp
          has_swap = true
        end
      end
      return self unless has_swap
    end

    self
  end

  def selection_sort
    (0...self.size).each do |i|
      smallest_index, tmp = i, self[i]

      (i+1...self.size).each do |j|
        if self[j] < self[smallest_index]
          smallest_index = j
        end
      end

      self[i] = self[smallest_index]
      self[smallest_index] = tmp
    end

    self
  end

  def insert_sort
    (0...self.size).each do |i|
      tmp = self[i]

      (i-1).downto(0) do |j|
        if tmp < self[j]
          self[j+1] = self[j]
          self[j] = tmp
        else
          break
        end
      end
    end

    self
  end

  def hell_sort
    gap = self.size / 2
    while gap > 0
      (gap...self.size).each do |i|
        j = i
        while (j - gap >= 0 && self[j] < self[j - gap])
          tmp = self[j]
          self[j] = self[j - gap]
          self[j - gap] = tmp
          j -= gap
        end
      end
      gap = gap / 2
    end
    self
  end

  def merge_sort
    merge_divide(self)
  end

  def quick_sort
    quick_divide_conquer(self)
  end

  private

  def merge_divide(ary)
    length = ary.size
    return ary if length < 2

    mid = length / 2

    left = ary[0...mid]
    right = ary[mid...length]
    merge_conquer(merge_divide(left), merge_divide(right))
  end

  def merge_conquer(left, right)
    result = []

    while !left.empty? && !right.empty?
      if left.first <= right.first
        result << (left.shift)
      else
        result << (right.shift)
      end
    end

    until left.empty?
      result << (left.shift)
    end

    until right.empty?
      result << (right.shift)
    end

    result
  end

  def quick_divide_conquer(ary)
    if k = ary.shift
      left = quick_divide_conquer(ary.select{|j| j <= k })
      right = quick_divide_conquer(ary.select{|i| i > k })
      left + [k] + right
    else
      []
    end
  end
end
