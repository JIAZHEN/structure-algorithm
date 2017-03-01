require_relative "../spec_helper"
require_relative "../../data-structures/queue/queue_data_structure"

describe QueueDataStructure do

  before { @queue = described_class.new }

  context "#to_s" do
    it "prints when queue is empty" do
      expect(@queue.to_s).to eq("head. Tail: ()")
    end
  end

  context "#dequeue" do
    before do
      (1..3).each { |n| @queue.enqueue(n) }
    end

    it "works properly" do
      node = @queue.dequeue
      expect(@queue.to_s).to eq("head-->2-->3. Tail: (3)")
      expect(node.key).to eq(1)
    end

    it "clears tail when empty" do
      3.times { @queue.dequeue }
      expect(@queue.to_s).to eq("head. Tail: ()")
      expect(@queue.tail).to eq(@queue.head)
    end
  end

  context "#enqueue" do
    before do
      (5..7).each { |n| @queue.enqueue(n) }
    end

    it "works properly" do
      expect(@queue.to_s).to eq("head-->5-->6-->7. Tail: (7)")
    end
  end
end
