RSpec.describe HeapNode do

	context "Class" do

		let(:heap_node) { HeapNode.new }

		it "responds to data" do
			expect(heap_node).to respond_to(:data)
		end

		it "responds to cost" do
			expect(heap_node).to respond_to(:cost)
		end
	end
end