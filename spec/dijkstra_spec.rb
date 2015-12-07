RSpec.describe Dijkstra do

	context "Class" do

		let(:dijkstra) { Dijkstra.new }

		it "responds to nodes" do
			expect(dijkstra).to respond_to(:shortest_paths)
		end
	end

	# in spec/graph/support/test_graph_image.jp2 is the graph image.
	context "acts as dijkstra algorithm" do

		before(:all) do
			@graph = Graph.new

			@node_a = Node.new(data: 'A')
			@node_b = Node.new(data: 'B')
			@node_c = Node.new(data: 'C')
			@node_d = Node.new(data: 'D')
			@node_e = Node.new(data: 'E')

			# Edges from node A
			edge_a_b = Edge.new(from: @node_a, to: @node_b, cost: 1)
			edge_a_d = Edge.new(from: @node_a, to: @node_d, cost: 4)
			edge_a_c = Edge.new(from: @node_a, to: @node_c, cost: 5)

			@node_a.edges = [edge_a_b, edge_a_d, edge_a_c]

			# Edges from node B
			edge_b_d = Edge.new(from: @node_b, to: @node_d, cost: 2)
			edge_b_e = Edge.new(from: @node_b, to: @node_e, cost: 15)

			@node_b.edges = [edge_b_d, edge_b_e]

			# Edges from node C
			edge_c_e = Edge.new(from: @node_c, to: @node_e, cost: 1)

			@node_c.edges = [edge_c_e]

			# Edges from node D
			edge_d_e = Edge.new(from: @node_d, to: @node_e, cost: 3)
			edge_d_c = Edge.new(from: @node_d, to: @node_c, cost: 4)

			@node_d.edges = [edge_d_e, edge_d_c]

			# Edges from node E
			@node_e.edges = []

			@graph.nodes = [@node_a, @node_b, @node_c, @node_d, @node_e]

			@dijkstra = Dijkstra.new(graph: @graph)
		end

		it "finds correctly the shortests paths" do
			@dijkstra.shortest_paths
			expected_hash =
			{ @node_a =>{:cost=>0},
 				@node_b =>{:cost=>1, :previous=> @node_a},
 				@node_d =>{:cost=>3, :previous=> @node_b},
 				@node_c =>{:cost=>5, :previous=> @node_a},
 				@node_e =>{:cost=>6, :previous=>@node_d}
 			}

 			expect(@dijkstra.costs).to eq(expected_hash)

		end
	end
end