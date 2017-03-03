def merge(arr)
  # PRECONDITION: halves already sorted
  lo = 0
  hi = arr.length - 1
  mid = hi / 2

  left_pointer = lo
  right_pointer = mid + 1

  arr.inject([]) do |acc, _|
    if left_pointer > mid
      acc.push arr[right_pointer]
      right_pointer += 1
    elsif right_pointer > hi
      acc.push arr[left_pointer]
      left_pointer += 1
    elsif arr[left_pointer] < arr[right_pointer]
      acc.push arr[left_pointer]
      left_pointer += 1
    else
      acc.push arr[right_pointer]
      right_pointer += 1
    end

    acc
  end
end

merge([3, 5, 4, 9])
merge([3, 5, 5, 7, 9, 1, 5, 8, 9])
