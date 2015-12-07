  class HeapNode
  	attr_accessor :data, :cost

  	def initialize(args = {})
  		@data  = args[:data]
  		@cost = args[:cost]
  	end

    def <(other_heap_node)
      cost < other_heap_node.cost
    end

    def <=(other_heap_node)
      cost <= other_heap_node.cost
    end

    def >(other_heap_node)
      cost > other_heap_node.cost
    end

    def ==(other_heap_node)
  		return false if other_heap_node.nil?
      cost == other_heap_node.cost
    end

    def to_s
      "Heap Node #{data}, cost: #{cost}"
    end
  end