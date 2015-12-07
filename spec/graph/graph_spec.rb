RSpec.describe Graph do

	context "Class" do

		let(:graph) { Graph.new }

		it "responds to nodes" do
			expect(graph).to respond_to(:nodes)
		end
	end
end