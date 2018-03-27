class Graph
  class Node
    attr_reader :id
    attr_accessor :adjacents

    def initialize(id)
      @id = id
      @adjacents = []
    end
  end

  attr_accessor :nodes_by_id

  def initialize
    @nodes_by_id = {}
  end

  def get_node(id)
    nodes_by_id[id]
  end

  def add_edge(souce_id, destination_id)
    source, destination = get_nodes(source_id, destination_id)
    source.adjacents << destination
  end

  def has_path_dfs(source_id, destination_id)
    source, destination = get_nodes(source_id, destination_id)
    dfs_path(source, destination, [])
  end

  def has_path_bfs(source_id, destination_id)
    source, destination = get_nodes(source_id, destination_id)
    bfs_path(destination, [], Queue.new.enq(source))
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
