class Array
  def binary_search(target)
    low, high = 0, size - 1

    while low <= high
      mid = low + (high - low) / 2

      if self[mid] > target
        high = mid - 1
      elsif self[mid] < target
        low = mid + 1
      else
        return mid
      end
    end
  end
end

class BinarySearch
  def self.rotation_point(words)
    low, high = 0, words.size - 1

    while low <= high
      mid = low + (high - low) / 2
      return mid if words[mid -1] > words[mid]
      low = mid + 1
    end

    -1
  end
end
