RSpec.describe Edge do

	context "Class" do

		let(:edge) { Edge.new }

		it "responds to from" do
			expect(edge).to respond_to(:from)
		end

		it "responds to to" do
			expect(edge).to respond_to(:to)
		end

		it "responds to cost" do
			expect(edge).to respond_to(:cost)
		end
	end
end