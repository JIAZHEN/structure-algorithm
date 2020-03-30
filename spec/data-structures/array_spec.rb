require_relative "../spec_helper"
require_relative "../../data-structures/array/merge_cal"

describe MergeCal do
  context "#merge" do
    it "merges the meeting" do
      meetings = [[0, 1], [3, 5], [4, 8], [10, 12], [9, 10]]
      expect(described_class.merge(meetings)).to eq([[0, 1], [3, 8], [9, 12]])
    end

    it "merges the meeting" do
      meetings = [[1, 2], [2, 3]]
      expect(described_class.merge(meetings)).to eq([[1, 3]])
    end

    it "merges the meeting" do
      meetings = [[1, 5], [2, 3]]
      expect(described_class.merge(meetings)).to eq([[1, 5]])
    end

    it "merges the meeting" do
      meetings = [[1, 10], [2, 6], [3, 5], [7, 9]]
      expect(described_class.merge(meetings)).to eq([[1, 10]])
    end

    it "merges the meeting" do
      meetings = [[1, 3], [2, 4]]
      expect(described_class.merge(meetings)).to eq([[1, 4]])
    end
  end

  context "in-place reverse" do
    def reverse!(string)
      length = string.size
      (0...(length / 2)).each do |n|
        right_idx = length - n - 1
        string[n], string[right_idx] = string[right_idx], string[n]
      end
      string
    end

    it "works for empty string" do
      expect(reverse!("")).to eq("")
    end

    it "works for one string" do
      expect(reverse!("A")).to eq("A")
    end

    it "works for more strings" do
      expect(reverse!("ABCDE")).to eq("EDCBA")
    end
  end
end
