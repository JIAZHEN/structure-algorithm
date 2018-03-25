require_relative "../spec_helper"
require_relative "../../data-structures/trees/binary_tree_node"

#       5
#     3    6
#   2  4      7
# 1

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

  context "#bfs" do
    it "returns the tree's value in Breadth-First search" do
      expect(@root.bfs).to eq([5, 3, 6, 2, 4, 7, 1])
    end
  end

  context "#dfs_inorder" do
    it "returns the tree's value in Depth-First in-order" do
      expect(@root.dfs(:inorder)).to eq([1, 2, 3, 4, 5, 6, 7])
    end

    it "returns the tree's value in Depth-First pre-order" do
      expect(@root.dfs(:preorder)).to eq([5, 3, 2, 1, 4, 6, 7])
    end

    it "returns the tree's value in Depth-First post-order" do
      expect(@root.dfs(:postorder)).to eq([1, 2, 4, 3, 7, 6, 5])
    end
  end

  context "#delete" do
    it "deletes the leaf" do
      @root.delete(7)
      expect(@root.dfs(:inorder)).to eq([1, 2, 3, 4, 5, 6])
    end

    it "deletes the leaf" do
      @root.delete(1)
      expect(@root.dfs(:inorder)).to eq([2, 3, 4, 5, 6, 7])
    end

    it "deletes the middle" do
      @root.insert(6.5)
      @root.insert(9)
      @root.insert(8.5)
      @root.insert(11)
      @root.delete(7)
      expect(@root.dfs(:inorder)).to eq([1, 2, 3, 4, 5, 6, 6.5, 8.5, 9, 11])
    end
  end

  it "returns the min" do
    expect(@root.min).to eq(1)
  end

  it "returns the max" do
    expect(@root.max).to eq(7)
  end

  it "returns the height" do
    expect(@root.height).to eq(4)
  end
end
