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
      .reduce(Hash.new(0)) {|h, c| h[c] += 1; h}
      .partition {|_, v| v.even?}
      .last.size <= 1
  end
end
