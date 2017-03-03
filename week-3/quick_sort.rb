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
      - until i and j cross (that is, i >= j)
        - i++ as long as a[i] < a[lo]
        - j++ as long as a[j] > a[lo]
        - when both stop, SWAP THEM
      - at this point, swap a[lo] with a[j]
  - Sort each piece recursively
=end

def quick_sort(a)
  return a if a.length <= 1

  a.shuffle!

  sort a, 0, a.length - 1
  a
end

def sort(a, anchor, last)
  return a if anchor == last
  i = anchor + 1
  j = last

  loop do
    until a[i] > a[anchor] || i == last
      i += 1
    end

    until a[j] < a[anchor] || j == anchor
      j -= 1
    end

    break if i >= j
    a[i], a[j] = a[j], a[i]
  end

  # move anchor to pivot point
    # At this point, i will be greater or equal, j will be less than or equal
  a[j], a[anchor] = a[anchor], a[j]

  # RECURSE for both halves
  if last - anchor >= 2
    sort a, anchor, j
    sort a, i, last
  end
end

# TEST
quick_sort [1]
quick_sort [3, 1]
quick_sort [1, 3]
quick_sort [5, 2, 66, 3]
quick_sort [9, 5, 2, 6, 3]
