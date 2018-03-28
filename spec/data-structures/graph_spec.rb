require_relative "../spec_helper"
require_relative "../../data-structures/graph/graph"

describe Graph do
  let(:graph) { described_class.new}

  context "#add_node" do
    it "stores the nodes" do
      nodes = %w(A B C D E F G).map { |id| described_class::Node.new(id) }
      graph.add_node(*nodes)
      expect(graph.nodes_by_id).to eq(nodes.map{|n| [n.id,n]}.to_h)
    end
  end

  context "#add_edge" do
    it "stores the nodes" do
      nodes = %w(A B C D E).map { |id| described_class::Node.new(id) }
      graph.add_node(*nodes)
      graph.add_edge('A', 'B', length: 6)
      graph.add_edge('A', 'D', length: 1)
      graph.add_edge('B', 'C', length: 5)
      graph.add_edge('D', 'B', length: 2)
      graph.add_edge('D', 'E', length: 1)
      graph.add_edge('E', 'B', length: 2)
      graph.add_edge('E', 'C', length: 5)
      expect(graph.edges).to eq({
        "A-B" => 6,
        "B-A" => 6,
        "A-D" => 1,
        "D-A" => 1,
        "B-C" => 5,
        "C-B" => 5,
        "D-B" => 2,
        "B-D" => 2,
        "D-E" => 1,
        "E-D" => 1,
        "E-B" => 2,
        "B-E" => 2,
        "E-C" => 5,
        "C-E" => 5
      })
    end
  end
end
