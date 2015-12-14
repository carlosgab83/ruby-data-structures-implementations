class MergeSort

  def sort(array)
    return array if array.length == 1  || array.length == 0
    merge(sort(left(array)), sort(right(array)))
  end

  private

  def mid(array)
    (array.length/2).to_i() -1
  end

  def left(array)
    array[0..mid(array)]
  end

  def right(array)
    array[(mid(array)+1)..(array.length-1)]
  end

  def merge(left, right)
    ordered = []
    i = 0
    j = 0
    loop do
      if i < left.length && j < right.length
        if left[i] < right[j]
          ordered << left[i]
          i +=1
        else
          ordered << right[j]
          j +=1
        end
      end

      if i >= left.length
        ordered += right[j..(right.length-1)]
        return ordered
      elsif j >= right.length
        ordered += left[i..(left.length-1)]
        return ordered
      end
    end
  end
end