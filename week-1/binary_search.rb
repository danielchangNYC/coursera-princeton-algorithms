=begin

Goal: Given a sorted array, find the index of a key in that array.
Method: Compare key against middle entry
  If less, go left.
  If more, go right.
  Repeat until found.

KEY: USE THE INDEX FOR HI AND LOW

=end

def binary_search(data, key)
  lo = 0
  hi = data.length - 1

  until hi == lo do
    mid = (hi + lo) / 2
    mid_val = data[mid]

    if mid_val == key
      found_idx = mid
      break
    elsif key < mid_val
      hi = mid - 1
    else
      lo = mid + 1
    end
  end
  found_idx ||= -1
end

# Test

a = [1, 2, 2, 4, 5, 6, 6] # length 7
b = [1, 2, 2, 4, 5, 6, 6, 7] # length 8

binary_search(a, 4) # outcome should be 3
binary_search(a, 1) # outcome should be 0
binary_search(a, 2) # outcome should be 1
binary_search(b, 4) # outcome should be 3
binary_search(b, 6) # outcome should be 5
binary_search(b, 2) # outcome should be 1
binary_search(b, 9) # outcome should be -1
