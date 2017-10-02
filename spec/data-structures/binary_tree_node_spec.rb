require_relative "../spec_helper"
require_relative "../../data-structures/trees/binary_tree_node"

describe BinaryTreeNode do

  before { @root = described_class.new(5) }

  context "#insert" do
    let(:values) { [3, 6, 2, 4, 7] }

    it "builds the binary tree" do
      values.each { |value| @root.insert(value) }
      expect(@root.left.value).to eq(3)
      expect(@root.right.value).to eq(6)
    end
  end

  context "#find" do
    let(:values) { [3, 6, 2, 4, 7] }

    it "finds the node" do
      values.each { |value| @root.insert(value) }
      found_node = @root.find(3)
      expect(found_node.value).to eq(3)
      expect(found_node.left.value).to eq(2)
      expect(found_node.right.value).to eq(4)
    end
  end
end
