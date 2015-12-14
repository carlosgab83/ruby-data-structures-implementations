class Node
  attr_accessor :data, :edges

  def initialize(args = {})
    @data  = args[:data]
    @edges = args[:edges] || []
  end

  def <=>(other_node)
    data <=> other_node.data
  end

  def to_s
    "Node #{data}"
  end
end