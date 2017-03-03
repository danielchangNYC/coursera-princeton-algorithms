=begin

STRATEGY:
  - shuffle the array
  - rearrange, comparing with an anchor point (just use the first element)
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

COST:
  WORST CASE is N^2
    - But because of SHUFFLE, it's closer to NlogN
    - Worst happens when array is reverse-sorted or has many dups
  Pros:
    - Sort in place (memory)
    - Fastest (NlogN still but faster than merge sort)
  Cons:
    - Testing when pointers cross is tricky, esp w dup keys
      - it's apparently better to stop on dup keys?
    - Staying in bounds
    - Preserving randomness. Shuffling needed to guarantee performance

PRACTICAL IMPROVEMENTS:
  - Use insertion sort if <10 items
  - Use smarter pivot points: sample 3 random and get median
=end

def quick_sort(a)
  return a if a.length <= 1

  a.shuffle!

  sort a, 0, a.length - 1
  a
end

def rearrange(a, lo, hi)
  i = lo
  j = hi

  loop do
    i += 1 until a[i] > a[lo] || i == hi
    j -= 1 until a[j] < a[lo] || j == lo
    break if i >= j
    a[i], a[j] = a[j], a[i]
  end

  a[j], a[lo] = a[lo], a[j]
  j
end

def sort(a, lo, hi)
  return if hi <= lo
  j = rearrange(a, lo, hi)
  sort(a, lo, j-1)
  sort(a, j+1, hi)
end

# def sort(a, anchor, last)
#   return a if anchor == last
#   i = anchor + 1
#   j = last

#   loop do
#     i += 1 until a[i] > a[anchor] || i == last
#     j -= 1 until a[j] < a[anchor] || j == anchor
#     break if i >= j
#     a[i], a[j] = a[j], a[i]
#   end

#   # move anchor to pivot point
#     # At this point, i will be greater or equal, j will be less than or equal
#   a[j], a[anchor] = a[anchor], a[j]

#   # RECURSE for both halves
#   if last - anchor >= 2
#     sort a, anchor, j
#     sort a, i, last
#   end
# end

# TEST
quick_sort [1]
quick_sort [3, 1]
quick_sort [1, 3]
quick_sort [5, 2, 66, 3]
quick_sort [9, 5, 2, 6, 3]
