=begin
  Insertion Sort

  STRATEGY: In iteration i, swap a[i] with each larger entry to its left. OR ELSE STOP.
    (so for first iteration, nothing happens because nothing to left)
    (will have to compare each entry with EVERY entry on left)

  TIME COST:
    WORST CASE: N^2
      - slightly WORSE than selection sort because an actual exchange happens per comparison
    BEST CASE: N
      - Only N comparisons!
=end

def insertion_sort(arr)
  arr.each_with_index do |current_val, idx|
    (1..idx).each do |tmp_idx|
      compared_idx = idx - tmp_idx
      current_idx = compared_idx + 1

      if arr[compared_idx] > current_val
        arr[current_idx], arr[compared_idx] = arr[compared_idx], arr[current_idx]
      else
        break
      end
    end

  end
end

# test

a = [5, 2, 5, 7, 8, 5, 1, 9, 3, 2]
insertion_sort a # [1, 2, 2, 3, 5, 5, 5, 7, 8, 9]
