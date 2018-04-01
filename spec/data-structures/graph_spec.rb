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
      graph.add_edge('A', 'B', len: 6)
      graph.add_edge('A', 'D', len: 1)
      graph.add_edge('B', 'C', len: 5)
      graph.add_edge('D', 'B', len: 2)
      graph.add_edge('D', 'E', len: 1)
      graph.add_edge('E', 'B', len: 2)
      graph.add_edge('E', 'C', len: 5)
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

  context "about path" do
    let(:nodes) { %w(A B C D E).map { |id| described_class::Node.new(id) } }
    let(:nodes_hash) { nodes.map{|n| [n.id,n]}.to_h }

    before do
      graph.add_node(*nodes)
      graph.add_edge('A', 'B', len: 6)
      graph.add_edge('A', 'D', len: 1)
      graph.add_edge('B', 'C', len: 5)
      graph.add_edge('D', 'B', len: 2)
      graph.add_edge('D', 'E', len: 1)
      graph.add_edge('E', 'B', len: 2)
      graph.add_edge('E', 'C', len: 5)
    end

    context "#has_path?" do
      it "returns nil when destination not found" do
        expect(graph.has_path?('A', 'G')).to be_falsey
      end

      it "returns nil when source not found" do
        expect(graph.has_path?('H', 'A')).to be_falsey
      end

      it "returns true when path is found" do
        expect(graph.has_path?('B', 'A')).to be_truthy
      end
    end

    context "#dfs_path" do
      it "returns the correct path" do
        source, destination = graph.get_nodes('A', 'B')
        expect(graph.dfs_path(source, destination, [])).to eq(nodes_hash.values_at('A', 'B'))

        source, destination = graph.get_nodes('A', 'C')
        expect(graph.dfs_path(source, destination, [])).to eq(nodes_hash.values_at('A', 'B', 'C'))
      end
    end

    context "#bfs_path" do
      it "returns the correct path" do
        source, destination = graph.get_nodes('A', 'B')
        expect(graph.bfs_path(destination, [], Queue.new.enq(source))).to eq(
          nodes_hash.values_at('A', 'B'))

        source, destination = graph.get_nodes('A', 'C')
        expect(graph.bfs_path(destination, [], Queue.new.enq(source))).to eq(
          nodes_hash.values_at('A', 'B', 'D', 'C'))
      end
    end

    context "#dijkstra" do
      before { graph.build_dijkstra! }

      it "builds the dijkstra table" do
        expect(graph.dijkstra).to eq({
          'A' => {len: 0, prev: 'A'},
          'B' => {len: 3, prev: 'D'},
          'C' => {len: 7, prev: 'E'},
          'D' => {len: 1, prev: 'A'},
          'E' => {len: 2, prev: 'D'}
        })
      end

      it "find the correct shortest path with length" do
        expect(graph.shortest_path('B', 'B')).to eq([[], 0])
        expect(graph.shortest_path('B', 'A')).to eq([['B', 'D', 'A'], 3])
      end
    end
  end
end
