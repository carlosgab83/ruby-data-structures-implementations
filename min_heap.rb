class MinHeap

  attr_reader  :heap, :size
  alias_method :to_a, :heap

  def initialize(array = nil)
    @size = 0
    heapify array
  end

  def heapify array
    array = [] if array.nil?
    @heap = Array.new(array.size)

    array.each do |elem|
      insert(elem)
    end
  end

  def insert(elem)
    i       = first_empty_position
    heap[i] = elem
    sift_up(i)
    @size += 1
  end

  def extract_min
    return nil if heap.empty?

    i            = root_index
    last_i       = last_busy_position
    elem         = heap[i]
    heap[i]      = heap[last_i]
    heap[last_i] = nil
    sift_down(i)
    @size -= 1
    elem
  end

  private

  def sift_up(index)
    return if root?(index)

    parent_index = ( (index - 1) / 2 ).to_i

    if heap[index] < heap[parent_index]
      swap(index, parent_index)
      sift_up(parent_index)
    end
  end

  def sift_down(index)
    child_index1 = 2 * index + 1
    child_index2 = 2 * index + 2

    child_index_to_compare = lesser_elem_index(child_index1, child_index2)

    if heap[child_index_to_compare] != nil and heap[index] > heap[child_index_to_compare]
      swap(index, child_index_to_compare)
      sift_down(child_index_to_compare)
    end
  end

  def lesser_elem_index (index1, index2)
    if heap[index1].nil? or heap[index2].nil?
      return index1 || index2
    end

    heap[index1] <= heap[index2] ? index1 : index2
  end

  def swap(index1, index2)
    tmp          = heap[index1]
    heap[index1] = heap[index2]
    heap[index2] = tmp
  end

  def first_empty_position
    size
  end

  def last_busy_position
    size-1
  end

  def root?(index)
    index == root_index
  end

  def root_index
    0
  end
end