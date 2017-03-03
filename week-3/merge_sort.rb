=begin
  COST: nlogn
    - comparison is linear
    - dividing up the tree is logarithmic

  VARIANT: Bottom Up Merge Sort
    - STRATEGY Sort pairs, then merge to 4s, 8s, 16s... until sorted
    - CON: Takes up more space
=end

def merge_sort(arr)
  return if arr.length < 2
  orig_arr_ref = arr

  sort(arr, 0, arr.length - 1)
  arr
end

def sort(arr, lo, hi)
  return if hi <= lo
  mid = (lo + hi) / 2

  # recursively, sort each half
  sort(arr, lo, mid)
  sort(arr, mid + 1, hi)
  merge(arr, lo, hi, mid)
end

def merge(arr, lo, hi, mid)
  return if hi <= lo
  orig_arr_ref = arr.dup

  left_pointer = lo
  right_pointer = mid + 1

  (lo..hi).each do |current_idx|
    if left_pointer > mid
      arr[current_idx] = orig_arr_ref[right_pointer]
      right_pointer += 1
    elsif right_pointer > hi
      arr[current_idx] = orig_arr_ref[left_pointer]
      left_pointer += 1
    elsif orig_arr_ref[left_pointer] < orig_arr_ref[right_pointer]
      arr[current_idx] = orig_arr_ref[left_pointer]
      left_pointer += 1
    else
      arr[current_idx] = orig_arr_ref[right_pointer]
      right_pointer += 1
    end
  end
end

merge_sort([3, 5, 4, 9])
merge_sort([3, 5, 5, 7, 9, 1, 5, 8, 9])
