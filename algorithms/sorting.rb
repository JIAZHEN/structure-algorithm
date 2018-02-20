class Array
  def bubble_sort
    for i in (0...self.size)
      for j in (i+1...self.size)
        if self[i] > self[j]
          tmp = self[i]
          self[i] = self[j]
          self[j] = tmp
        end
      end
    end

    self
  end

  def select_sort
    for i in (0...self.size)
      smallest_index, tmp = i, self[i]

      for j in ((i+1)...self.size)
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
    for i in (0...self.size)
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

  def shell_sort
    gap = self.size/2

    while gap > 0

      for i in (gap...self.size)
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
end
