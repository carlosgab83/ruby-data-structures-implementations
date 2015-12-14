module Tree
  class Node
  	attr_accessor :data, :children

  	def initialize(args = {})
  		@data  = args[:data]
  		@children = args[:children] || []
  	end

    def leaf?
      children.nil?
    end

    def to_s
      "#{data}"
    end
  end
end