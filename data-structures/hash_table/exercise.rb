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
      if move_hash[remaining_length] && (move_hash[remaining_length] - [idx]).size >= 1
        return true
      end
    end

    false
  end
end
