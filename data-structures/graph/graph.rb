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
    @edges = {}
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
    desc.adjacents << src
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
      node = queue.shift
      return false if visited.include?(node)
      visited << node

      if node == desc
        return visited
      else
        (node.adjacents - visited).each { |adjacent| queue.enq(adjacent) }
      end
    end
  end

  def dijkstra_for(src_id)
    unvisted = nodes_by_id.keys - [src_id]
    cur_id, start_len, dijkstra = src_id, 0, {}

    until unvisted.empty?
      min_len, min_id = Float::INFINITY, nil
      visited_nodes = get_nodes(*(nodes_by_id.keys - unvisted))
      (nodes_by_id[cur_id].adjacents - visited_nodes).each do |adjacent|
        adjacent_id = adjacent.id
        dijkstra[adjacent_id] ||= {len: Float::INFINITY, prev: adjacent_id}

        if (len = get_edge(adjacent_id, cur_id)) && (start_len + len) < dijkstra[adjacent_id][:len]
          dijkstra[adjacent_id] = {len: (start_len + len), prev: cur_id}
          if min_len > (start_len + len)
            min_len = start_len + len
            min_id = adjacent_id
          end
        end
      end
      start_len = min_len
      cur_id = unvisted.delete(min_id) || unvisted.pop
    end

    dijkstra
  end

  def shortest_path(src_id, desc_id)
    path, length = [], 0
    (return [path, length]) if src_id == desc_id

    dijkstra = dijkstra_for(src_id)
    length = dijkstra[desc_id][:len]

    while record = dijkstra[desc_id]
      path << desc_id

      if record[:prev] == src_id
        return (path << src_id).reverse, length
      else
        desc_id = dijkstra[desc_id][:prev]
      end
    end
  end
end
