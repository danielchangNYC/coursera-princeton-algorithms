=begin

STRATEGY:
  - shuffle the array
  - partition with an anchor point (just use the first element)
    - GOAL:
      - entry a[j] is in place
      - no larger entry to the left
      - no smaller entry to the right
    - STRATEGY:
      - use first element as anchor a[lo]
      - two idx trackers, i and j.
      - until i and j cross (that is, i > j)
        - i++ as long as a[i] < a[lo]
        - j++ as long as a[j] > a[lo]
        - when both stop, SWAP THEM
      - at this point, swap a[lo] with a[i]
  - Sort each piece recursively
=end

def quick_sort(a)
  return a if a.length < 2

  a.shuffle!

  sort a, 0, a.length - 1
  a
end

def sort(a, anchor, last)
  return a if anchor == last
  i = anchor + 1
  j = last

  until i > j
    # move i up until it a[i] > a[anchor]
    # move j down until it a[j] < a[anchor]
      # when both these conditions are met, SWAP
      # break if EVER i > j

    until a[i] > a[anchor] || i > j || i == last
      i += 1
      # p "i: #{i}"
    end

    until a[j] < a[anchor] || i > j || j == anchor
      j -= 1
      # p "i: #{j}"
    end

    # p "Swapping i #{i} and j #{j} from arr: #{a}"
    a[i], a[j] = a[j], a[i]
    # p "Result arr #{a}"
  end

  a[i], a[anchor] = a[anchor], a[i]
  "Final swap #{a}"

  unless last - anchor == 1
    sort a, anchor, j
    sort a, j, last
  end
end

quick_sort [1]
quick_sort [3, 1]
quick_sort [1, 3]
quick_sort [5, 2, 66, 3]
quick_sort [9, 5, 2, 6, 3]
