  class Graph
  	attr_accessor :nodes

    def initialize(args = {})
      @nodes = args[:nodes] || []
    end

    def to_s
      "Nodes #{nodes}"
    end
  end