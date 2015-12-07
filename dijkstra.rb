class Dijkstra

  attr_reader  :priority_queue, :graph, :start_node, :visits, :min_edge_heap,
               :costs, :min_node_heap

  def initialize(args = {})
    @graph          = args[:graph] || Graph.new
    @start_node     = args[:start_node] || graph.nodes.first
    @visits         = {}
    @costs          = {}
    initialize_priority_queue(graph.nodes, start_node)
  end

  def shortest_paths
    costs[start_node] = {cost: 0}

    while ((current_heap_node = priority_queue.extract_min) != nil)
      current_node                  = current_heap_node.data
      next if visits[current_node] != nil
      visits[current_node]          = true
      create_min_heap_for_edges(current_node.edges)

      while ((edge_heap_node = min_edge_heap.extract_min) != nil)
        edge      = edge_heap_node.data
        dest_node = edge.to
        initialize_cost_if_needed(dest_node)
        tentative_cost = costs[current_node][:cost] + edge.cost

        if tentative_cost < costs[dest_node][:cost]
          update_cost_for_node(dest_node, current_node, costs[dest_node][:cost], tentative_cost)
        end
      end
    end
  end

  private

  def update_cost_for_node(dest_node, current_node, old_cost, new_cost)
    dest_heap_node = HeapNode.new(data: dest_node, cost: old_cost)
    new_heap_node  = HeapNode.new(data: dest_node, cost: new_cost)

    costs[dest_node][:cost]     = new_cost
    costs[dest_node][:previous] = current_node

    priority_queue.decrease_priority(dest_heap_node, new_heap_node )
  end

  def initialize_cost_if_needed(node)
    costs[node] = {cost: Float::INFINITY} if costs[node].nil?
  end

  def initialize_priority_queue(nodes, start_node)
    @priority_queue = MinHeap.new
    nodes.each do |node|
      cost = node == start_node ? 0 : Float::INFINITY
      priority_queue.insert(HeapNode.new(data: node, cost: cost))
    end
  end

  def create_min_heap_for_edges(edges)
    @min_edge_heap = MinHeap.new
    edges.each do |edge|
      min_edge_heap.insert(HeapNode.new(data: edge, cost: edge.cost))
    end
  end
end