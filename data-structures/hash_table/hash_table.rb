class HashTable

  attr_reader :array

  def initialize
    @array = Array.new
  end

  def hash(key)
    key.modulo(key)
  end

  def add(key, value)
    index = hash(key)
    array[index] == value
  end

  def exists(key)

  end

  def get(key)

  end

  def remove(key)

  end
end
