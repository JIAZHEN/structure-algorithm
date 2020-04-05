require 'set'

class Exercise
  def self.can_two_movies_fill_flight?(movies_lengths, flight_length)
    move_hash = movies_lengths
                  .each_with_index
                  .with_object({}) do |(movie_length, idx), result|
                    result[movie_length] ||= []
                    result[movie_length] << idx
                  end

    movies_lengths.each_with_index do |movie_length, idx|
      remaining_length = flight_length - movie_length
      if move_hash[remaining_length] && !(move_hash[remaining_length] - [idx]).empty?
        return true
      end
    end

    false
  end

  def self.has_palindrome_permutation?(the_string)
    the_string
      .chars
      .reduce(Set.new) do |set, c|
        set.include?(c) ? set.delete(c) : (set << c)
      end.size <= 1
  end

  def self.word_counts(input_string)
    input_string
      .scan(/\w+(?:-\w+)?(?:'s)?/)
      .reduce(Hash.new(0)) {|r, w| r[w] += 1; r}
  end
end
