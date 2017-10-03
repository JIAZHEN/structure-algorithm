require_relative "../spec_helper"
require_relative "../../data-structures/trees/binary_tree_node"

describe BinaryTreeNode do

  before do
    @root = described_class.new(5)
    [3, 6, 2, 4, 7, 1].each { |value| @root.insert(value) }
  end

  context "#insert" do
    it "builds the binary tree" do
      expect(@root.left.value).to eq(3)
      expect(@root.right.value).to eq(6)
    end
  end

  context "#find" do
    it "finds the node" do
      found_node = @root.find(3)
      expect(found_node.value).to eq(3)
      expect(found_node.left.value).to eq(2)
      expect(found_node.right.value).to eq(4)
    end

    it "returns nil when not found" do
      expect(@root.find(300)).to be_nil
    end
  end

  context "#path_for" do
    it "finds the path" do
      found_for_one = @root.path_for(1)
      found_for_seven = @root.path_for(7)
      expect(found_for_one).to eq([5, 3, 2, 1])
      expect(found_for_seven).to eq([5, 6, 7])
    end
  end

  context "#distance_between" do
    it "returns nil when value is not found" do
      expect(@root.distance_between(0, 1)).to be_nil
    end

    it "returns correct distances" do
      expect(@root.distance_between(1, 7)).to eq(5)
      expect(@root.distance_between(7, 1)).to eq(5)
    end

    it "returns correct distances" do
      expect(@root.distance_between(5, 5)).to eq(0)
      expect(@root.distance_between(4, 6)).to eq(3)
    end
  end
end
