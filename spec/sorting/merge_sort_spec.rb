RSpec.describe MergeSort do

	let(:merge_sort) { MergeSort.new }

	context "Class" do

		it "responds to sort" do
			expect(merge_sort).to respond_to(:sort)
		end
	end

	context "acts as merge_sort" do

		it "sort ordered even elements array" do
			expect(merge_sort.sort [1,2,3,4]).to eq [1,2,3,4]
		end

		it "sort ordered odd elements array" do
			expect(merge_sort.sort [1,2,3,4,5]).to eq [1,2,3,4,5]
		end

		it "sort unordered even elements array" do
			expect(merge_sort.sort [100,50,150,80]).to eq [50,80,100,150]
		end

		it "sort ordered odd elements array" do
			expect(merge_sort.sort [100,50,150,80,90]).to eq [50,80,90,100,150]
		end

		it "sort 0 elements array" do
			expect(merge_sort.sort []).to eq []
		end
	end

end