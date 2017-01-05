require_relative "../spec_helper"
require_relative "../../data-structures/linked-list/single_linked_tail_list"

describe SingleLinkedTailList do

  before { @linked_list = described_class.new }

  context "#to_s" do
    it "prints when list is empty" do
      expect(@linked_list.to_s).to eq("head. Tail: ()")
    end
  end

  context "#push_front" do
    before do
      (1..3).each { |n| @linked_list.push_front(n) }
    end

    it "works properly" do
      expect(@linked_list.to_s).to eq("head-->3-->2-->1. Tail: (1)")
    end
  end

  context "#pop_front" do
    before do
      (1..3).each { |n| @linked_list.push_front(n) }
    end

    it "works properly" do
      node = @linked_list.pop_front
      expect(@linked_list.to_s).to eq("head-->2-->1. Tail: (1)")
      expect(node.key).to eq(3)
    end

    it "clears tail when empty" do
      3.times { @linked_list.pop_front }
      expect(@linked_list.to_s).to eq("head. Tail: ()")
      expect(@linked_list.tail).to eq(@linked_list.head)
    end
  end

  context "#push_back" do
    before do
      (5..7).each { |n| @linked_list.push_back(n) }
    end

    it "works properly" do
      expect(@linked_list.to_s).to eq("head-->5-->6-->7. Tail: (7)")
    end
  end

  context "#pop_back" do
    context "when it's not empty list" do
      before do
        (5..7).each { |n| @linked_list.push_back(n) }
      end

      it "works properly" do
        node = @linked_list.pop_back
        expect(node.key).to eq(7)
        expect(@linked_list.to_s).to eq("head-->5-->6. Tail: (6)")
      end
    end

    context "when it's empty list" do
      it "works properly" do
        node = @linked_list.pop_back
        expect(node).to be_nil
        expect(@linked_list.to_s).to eq("head. Tail: ()")
      end
    end
  end

  context "#find" do
    context "when it's empty list" do
      let(:find_result) { @linked_list.find(7) }

      it "says not found" do
        expect(find_result).to eq("Cannot find 7 in the list")
      end
    end

    context "when it's not empty" do
      let(:find_result) { @linked_list.find(33) }

      before { (20..80).each { |n| @linked_list.push_back(n) } }

      it "says not found" do
        expect(find_result.key).to eq(33)
      end
    end
  end
end
