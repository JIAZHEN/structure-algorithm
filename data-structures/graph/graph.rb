class Graph
  class Node
    attr_reader :id
    attr_accessor :adjacents

    def initialize(id)
      @id = id
      @adjacents = []
    end
  end

  attr_accessor :nodes_by_id, :edges, :dijkstra

  def initialize
    @nodes_by_id = {}
    @edges = {}
    # key is destination node, value is a hash with length and previous node
    @dijkstra = {}
  end

  def get_node(id)
    nodes_by_id[id]
  end

  def get_edge(src_id, desc_id)
    edges["#{src_id}-#{desc_id}"]
  end

  def add_node(*nodes)
    nodes.map { |node| nodes_by_id[node.id] = node }
  end

  def get_nodes(*node_ids)
    node_ids.map { |node_id| get_node(node_id) }
  end

  def add_edge(src_id, desc_id, len:)
    src, desc = get_nodes(src_id, desc_id)
    src.adjacents << desc
    edges["#{src_id}-#{desc_id}"] = len
    edges["#{desc_id}-#{src_id}"] = len
  end

  def has_path?(src_id, desc_id, alg: :dfs)
    src, desc = get_nodes(src_id, desc_id)
    return false unless src && desc

    if alg == :dfs
      !!dfs_path(src, desc, [])
    elsif alg == :bfs
      !!bfs_path(desc, [], Queue.new.enq(src))
    else
      raise "Unknow path search algorithm"
    end
  end

  def dfs_path(src, desc, visited)
    return false if visited.include?(src)
    visited << src

    if src == desc
      visited
    else
      src.adjacents.each do |adjacent|
        return visited if dfs_path(adjacent, desc, visited)
      end
    end
  end

  def bfs_path(desc, visited, queue)
    until queue.empty?
      node = queue.deq
      return false if visited.include?(node)
      visited << node

      if node == desc
        return visited
      else
        node.adjacents.each { |adjacent| queue.enq(adjacent) }
      end
    end
  end

  def build_dijkstra!
    unvisted = nodes_by_id.keys
    desc_id = unvisted.shift
    start_len = 0
    dijkstra[desc_id] = {len: 0, prev: desc_id}

    until unvisted.empty?
      min_len, min_id = Float::INFINITY, nil
      nodes_by_id[desc_id].adjacents.each do |src_node|
        src_id = src_node.id
        dijkstra[src_id] ||= {len: Float::INFINITY, prev: src_id}

        if (len = get_edge(src_id, desc_id)) && (start_len + len) < dijkstra[src_id][:len]
          dijkstra[src_id] = {len: (start_len + len), prev: desc_id}
          if min_len > (start_len + len)
            min_len = start_len + len
            min_id = src_id
          end
        end
      end
      start_len = min_len
      desc_id = unvisted.delete(min_id) || unvisted.pop
    end
  end

  def shortest_path(desc_id, prev_id)
    path, length = [], 0

    (return [path, length]) if desc_id == prev_id

    while record = dijkstra[desc_id]
      path << desc_id

      if record[:prev] == prev_id
        return (path << prev_id), length
      else
        length += dijkstra[desc_id][:len]
        desc_id = dijkstra[desc_id][:prev]
      end
    end
  end
end
