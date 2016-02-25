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
end
