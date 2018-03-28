class Graph
  class Node
    attr_reader :id
    attr_accessor :adjacents

    def initialize(id)
      @id = id
      @adjacents = []
    end
  end

  attr_accessor :nodes_by_id, :edges

  def initialize
    @nodes_by_id = {}
    @edges = Hash.new(Float::INFINITY)
  end

  def get_node(id)
    nodes_by_id[id]
  end

  def get_edge(source_id, destination_id)
    edges["#{source_id}-#{destination_id}"]
  end

  def add_node(*nodes)
    nodes.map { |node| nodes_by_id[node.id] = node }
  end

  def add_edge(source_id, destination_id, length: Float::INFINITY)
    source, destination = get_nodes(source_id, destination_id)
    source.adjacents << destination
    edges["#{source_id}-#{destination_id}"] = length
    edges["#{destination_id}-#{source_id}"] = length
  end

  def has_path?(source_id, destination_id, alg: :dfs)
    source, destination = get_nodes(source_id, destination_id)
    if alg == :dfs
      dfs_path(source, destination, [])
    elsif alg == :bfs
      bfs_path(destination, [], Queue.new.enq(source))
    else
      raise "Unknow path search algorithm"
    end
  end

  private

  def get_nodes(*node_ids)
    node_ids.map { |node_id| get_node(node_id) }
  end

  def dfs_path(source, destination, visited)
    return false if visited.include?(source)
    visited << source

    if source == destination
      visited
    else
      source.adjacents.each do |adjacent|
        return visited if dfs_path(adjacent, destination, visited)
      end
    end
  end

  def bfs_path(destination, visited, queue)
    until queue.empty?
      node = queue.deq
      return false if visited.include?(node)
      visited << node

      if node == destination
        visited
      else
        node.adjacents.each { |adjacent| queue.enq(adjacent) }
      end
    end
  end
end
