class HashTable

  attr_reader :array

  def initialize
    @array = Array.new
  end

  def add(key, value)
    index = hashing(key)
    array[index] = value
  end

  def get(key)
    index = hashing(key)
    array[index]
  end

  def remove(key)
    index = hashing(key)
    array.delete_at(index)
  end

  private

  def hashing(key)
    key.chars.map(&:ord).reduce(&:*) % @array.size
  end
end
