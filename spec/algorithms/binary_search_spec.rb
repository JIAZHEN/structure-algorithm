require_relative "../spec_helper"
require_relative "../../algorithms/binary_search"

describe "Binary Search Algorithm" do
  it "returns nil when array is empty" do
    expect([].binary_search(3)).to be_nil
  end

  context "given a sorted array" do
    let(:array) { [10, 14, 19, 26, 27, 31, 33, 35, 42, 44] }

    it "raises error when target is nil" do
      expect{ array.binary_search(nil) }.to raise_error(ArgumentError)
    end

    it "returns nil when target is not in the array" do
      expect(array.binary_search(99)).to be_nil
    end

    it "returns the index when target is in the array" do
      expect(array.binary_search(33)).to eq(6)
    end
  end

  context ".rotation_point" do
    it "returns correctly for small array" do
      expect(BinarySearch.rotation_point(['cape', 'cake'])).to eq(1)
    end

    it "returns correctly for medium array" do
      words = ['grape', 'orange', 'plum', 'radish', 'apple']
      expect(BinarySearch.rotation_point(words)).to eq(4)
    end

    it "returns correctly for large array" do
      words = ['ptolemaic', 'retrograde', 'supplant',
               'undulate', 'xenoepist', 'asymptote',
               'babka', 'banoffee', 'engender',
               'karpatka', 'othellolagkage']
      expect(BinarySearch.rotation_point(words)).to eq(5)
    end
  end
end
