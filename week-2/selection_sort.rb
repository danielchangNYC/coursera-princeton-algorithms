=begin
  Selection Sort

  STRATEGY: For each index, keep finding minimum and stick it there.
  TIME COST: N^2, even if already sorted
=end

def selection_sort(arr)
  arr.each_with_index do |current_val, idx|
    current_min = current_val

    (idx..(arr.length - 1)).each do |compared_idx|
      if arr[compared_idx] < current_min
        arr[idx], arr[compared_idx] = arr[compared_idx], arr[idx]
        current_min = arr[idx]
      end
    end

  end
end

# test

a = [5, 2, 5, 7, 8, 5, 1, 9, 3, 2]
selection_sort a # [1, 2, 2, 3, 5, 5, 5, 7, 8, 9]
