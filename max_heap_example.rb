require 'simplest_benchmark'
require_relative 'max_heap.rb'

include SimplestBenchmark

	sb_begin('whole process')

		sb_begin('heapify')

			h = MaxHeap.new (0..9999).to_a

		sb_end('heapify')

		sb_begin('insert')

			h.insert 10000

		sb_end('insert')

		sb_begin('extract all')

			while h.size > 0
				h.extract_max
			end

		sb_end('extract all')

	sb_end('whole process')