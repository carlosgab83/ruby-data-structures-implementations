RSpec.describe MinHeap do

	context "Class" do

		let(:heap) { MinHeap.new }

		it "responds to heapify" do
			expect(heap).to respond_to(:heapify)
		end

		it "responds to insert" do
			expect(heap).to respond_to(:insert)
		end

		it "responds to extract_min" do
			expect(heap).to respond_to(:extract_min)
		end

		it "responds to decrease_priority" do
			expect(heap).to respond_to(:decrease_priority)
		end
	end

	context "acts as min-heap" do

		let(:heap) { MinHeap.new([16,15,14,14,13,12,11,10,9,8,7,6,5,4,3,2,1]) }

		it "creates a correct min-heap" do
			expect(heap.to_a).to eq [1,2,4,3,9,7,5,8,14,14,10,15,12,13,6,16,11]
		end

		it "retreive min priority elem" do
			expect(heap.extract_min).to eq 1
			expect(heap.extract_min).to eq 2
			expect(heap.extract_min).to eq 3
			expect(heap.extract_min).to eq 4
			expect(heap.extract_min).to eq 5
			expect(heap.extract_min).to eq 6
			expect(heap.extract_min).to eq 7
			expect(heap.extract_min).to eq 8
			expect(heap.extract_min).to eq 9
			expect(heap.extract_min).to eq 10
			expect(heap.extract_min).to eq 11
			expect(heap.extract_min).to eq 12
			expect(heap.extract_min).to eq 13
			expect(heap.extract_min).to eq 14
			expect(heap.extract_min).to eq 14
			expect(heap.extract_min).to eq 15
			expect(heap.extract_min).to eq 16
			expect(heap.extract_min).to eq nil
		end

		it "counts correctly num of elements" do
			heap.extract_min
			expect(heap.size).to eq 16
		end

		it "dont breaks with an empty array" do
			heap = MinHeap.new []
			expect(heap.size).to eq 0
			heap.extract_min
			expect(heap.size).to eq 0
		end

		it "decrease_priority correctly" do
			h = MinHeap.new([16,15,14,13])
			h.decrease_priority(16, 5)
			expect(h.extract_min).to eq 5
			expect(h.extract_min).to eq 13
			expect(h.extract_min).to eq 14
			expect(h.extract_min).to eq 15
			expect(h.extract_min).to eq nil
		end
	end

end