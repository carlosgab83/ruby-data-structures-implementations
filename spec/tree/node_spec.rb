RSpec.describe Tree::Node do

	context "Class" do

		let(:node) { Tree::Node.new }

		it "responds to data" do
			expect(node).to respond_to(:data)
		end

		it "responds to leaf?" do
			expect(node).to respond_to(:leaf?)
		end

		it "responds to children" do
			expect(node).to respond_to(:children)
		end
	end
end