require_relative "../spec_helper"
require_relative "../../data-structures/heap/max_heap"

describe MaxHeap do
  let(:max_heap) { described_class.new}

  context "#insert" do
    it "builds the heap" do
      [5, 6, 1, 9, 11, 8, 15, 21, 17].each { |value| max_heap.insert(value) }
      expect(max_heap.array).to eq([21, 17, 11, 15, 6, 1, 8, 5, 9])
    end
  end

  context "#remove" do
    it "rebuilds the heap" do
      [5, 6, 1, 9, 11, 8, 15, 21, 17].each { |value| max_heap.insert(value) }
      max_heap.remove(21)
      expect(max_heap.array).to eq([17, 15, 11, 9, 6, 1, 8, 5])
    end
  end
end
