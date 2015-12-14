RSpec.describe Tree::Tree do

	context "Class" do

		let(:tree) { Tree::Tree.new }

		it "responds to name" do
			expect(tree).to respond_to(:name)
		end

		it "responds to root" do
			expect(tree).to respond_to(:root)
		end

		it "responds to root=" do
			expect(tree).to respond_to(:root=)
		end

		it "responds to deep_first_search" do
			expect(tree).to respond_to(:deep_first_search)
		end

		it "responds to breadth_first_search" do
			expect(tree).to respond_to(:breadth_first_search)
		end
	end

	context "acts as a tree" do

		let(:tree) {
			tree = Tree::Tree.new

			@n_e = Tree::Node.new(data:'E')
			@n_f = Tree::Node.new(data:'F')

			@n_g = Tree::Node.new(data:'G')
			@n_h = Tree::Node.new(data:'H')

			@n_i = Tree::Node.new(data:'I')
			@n_j = Tree::Node.new(data:'J')

			@n_b = Tree::Node.new(data:'B', children: [@n_e, @n_f])
			@n_c = Tree::Node.new(data:'C', children: [@n_g, @n_h])
			@n_d = Tree::Node.new(data:'D', children: [@n_i, @n_j])

			@n_a = Tree::Node.new(data:'A', children: [@n_b, @n_c, @n_d])

			tree.root = @n_a
			tree
		}

		it "performs correctly a deep first search" do
			path = ['A','D','J','I','C','H','G','B','F']
			expect(tree.deep_first_search('F')).to eq @n_f
			expect(tree.path).to eq path
		end

		it "performs correctly a breadth first search" do
			path = ['A','B','C','D','E','F']
			expect(tree.breadth_first_search('F')).to eq @n_f
			expect(tree.path).to eq path
		end
	end
end