  class Edge
  	attr_accessor :from, :to, :cost

  	def initialize(args = {})
  		@from  = args[:from]
  		@to    = args[:to]
  		@cost  = args[:cost]
  	end

    def <=>(other_edge)
      cost <=> other_edge.cost
    end

    def to_s
      "#{from} -> #{to} : #{cost}"
    end
  end