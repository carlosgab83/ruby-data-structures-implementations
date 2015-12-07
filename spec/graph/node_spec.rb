RSpec.describe Node do

	context "Class" do

		let(:node) { Node.new }

		it "responds to data" do
			expect(node).to respond_to(:data)
		end

		it "responds to edges" do
			expect(node).to respond_to(:edges)
		end
	end
end