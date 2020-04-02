require_relative "../spec_helper"
require_relative "../../data-structures/hash_table/exercise"

describe Exercise do
  context ".two_movies_fill_flight?" do
    it "finds two movies" do
      expect(described_class.can_two_movies_fill_flight?([1, 2, 3, 4, 5, 6], 7)).to be_truthy
    end

    it "finds two movies" do
      expect(described_class.can_two_movies_fill_flight?([6, 6], 12)).to be_truthy
    end

    it "finds two movies" do
      expect(described_class.can_two_movies_fill_flight?([6], 12)).to be_falsey
    end
  end
end
