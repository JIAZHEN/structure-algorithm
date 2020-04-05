require_relative "../spec_helper"
require_relative "../../algorithms/greedy_algorithms"

describe GreedyAlgorithms do
  context ".get_max_profile" do
    it "returns 0 when given no information" do
      expect(described_class.get_max_profile([])).to eq(0)
    end

    it "returns 6 given [10, 7, 5, 8, 11, 9]" do
      expect(described_class.get_max_profile([10, 7, 5, 8, 11, 9])).to eq(6)
    end
  end

  context ".highest_product_of_3" do
    it "returns nil when given no information" do
      expect(described_class.highest_product_of_3([])).to be_nil
    end

    it "returns correctly for all negative" do
      expect(described_class.highest_product_of_3([-5, -1, -3, -2])).to eq(-6)
    end

    it "returns correctly for two negatives" do
      expect(described_class.highest_product_of_3([-10, 1, 3, 2, -10])).to eq(300)
    end

    it "returns correctly for long list" do
      expect(described_class.highest_product_of_3([6, 1, 3, 5, 7, 8, 2])).to eq(336)
    end
  end
end
