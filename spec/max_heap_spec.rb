RSpec.describe MaxHeap do

	context "Class" do

		let(:heap) { MaxHeap.new }

		it "responds to heapify" do
			expect(heap).to respond_to(:heapify)
		end

		it "responds to insert" do
			expect(heap).to respond_to(:insert)
		end

		it "responds to extract_max" do
			expect(heap).to respond_to(:extract_max)
		end

	end

	context "acts as max-heap" do

		let(:heap) { MaxHeap.new([1,2,3,4,5,6,7,8,9,10,11,12,13,14,14,15,16]) }

		it "creates a correct max-heap" do
			expect(heap.to_a).to eq [16,15,14,14,9,11,13,10,4,3,8,2,6,5,12,1,7]
		end

		it "retreive max priority elem" do
			expect(heap.extract_max).to eq 16
			expect(heap.extract_max).to eq 15
			expect(heap.extract_max).to eq 14
			expect(heap.extract_max).to eq 14
			expect(heap.extract_max).to eq 13
			expect(heap.extract_max).to eq 12
			expect(heap.extract_max).to eq 11
			expect(heap.extract_max).to eq 10
			expect(heap.extract_max).to eq 9
			expect(heap.extract_max).to eq 8
			expect(heap.extract_max).to eq 7
			expect(heap.extract_max).to eq 6
			expect(heap.extract_max).to eq 5
			expect(heap.extract_max).to eq 4
			expect(heap.extract_max).to eq 3
			expect(heap.extract_max).to eq 2
			expect(heap.extract_max).to eq 1
			expect(heap.extract_max).to eq nil
		end

		it "counts correctly num of elements" do
			heap.extract_max
			expect(heap.size).to eq 16
		end

		it "dont breaks with an empty array" do
			heap = MaxHeap.new []
			expect(heap.size).to eq 0
			heap.extract_max
			expect(heap.size).to eq 0
		end
	end

end