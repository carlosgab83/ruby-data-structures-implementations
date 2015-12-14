module Tree
  class Tree
    attr_reader   :path, :array
  	attr_accessor :name, :root

  	def initialize(args = {})
  		@name  = args[:name]
  		@root = args[:root] || []
      @array = []
  	end

    def to_s
      "Tree #{name}"
    end

    def deep_first_search(node_data)
      @path = []
      @array = []
      dfs(root,node_data)
    end

    def breadth_first_search(node_data)
      @path = []
      @array = []
      bfs(root,node_data)
    end

    private

    def dfs(node, node_data)
      @path << node.to_s
      return node if node.data == node_data
      @array += node.children
      while(@array.any?)
        current_node = @array.pop
        @path << current_node.to_s
        return current_node if current_node.data == node_data
        @array += current_node.children if not current_node.leaf?
      end
      return nil
    end

    def bfs(node, node_data)
      @path << node.to_s
      return node if node.data == node_data
      @array += node.children
      while(@array.any?)
        current_node = @array.shift
        @path << current_node.to_s
        return current_node if current_node.data == node_data
        @array += current_node.children if not current_node.leaf?
      end
      return nil
    end
  end
end