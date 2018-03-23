# Travelling salesman problem
class Tsp
  def length_of_longest_substring(s)
    return 0 unless s && !s.empty?
    if (matches = /(\w)\1*(\w+)/.match(s))
      return (matches[2].size + 1)
    end

    char_in_hash = {}
    s.chars.each_with_index do |char, index|
        char_in_hash[char] ||= []
        char_in_hash[char] << index
    end

    max_length = char_in_hash.map do |_, indexes|

        indexes.each_cons(2).map do |con|
            substring = s[con[0]...con[1]].chars
            substring.uniq.size == substring.size ? substring.size : 0
        end
    end.flatten.max

    max_length || s.size
  end
end
