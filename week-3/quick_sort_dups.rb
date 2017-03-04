=begin
  Three-way quick sort
  (Quick Sort accounting for dups)

  Given an array `a` of N entries...

  Strategy
    - SHUFFLE FIRST!!!
    - Use 3 pointers instead of 2: <, = and > than anchor
      - current position is also the equality one. var i for now.
      - < and = start at left where anchor is. > starts at end
      - Compare a[i] with anchor
        - if equal, i++
        - if less, swap a[i] with a[lt]. increment i and lt
        - if greater, swap a[i] with a[gt]. decrement gt
        - Recurse until gt <= i
      - swap
      - recurse for both sides of pivot
=end

def three_way_sort(a)
  return a if a.length <= 1
  # a.shuffle!

  sort(a, 0, a.length - 1)
  a
end

def sort(a, lo, hi)
  return if hi <= lo

  lt = lo # represents current equal val
  i = lo
  gt = hi # represents next gt value in question
  anchor = a[lo]

  until gt < i
    if a[i] == anchor
      i += 1
    elsif a[i] < anchor
      a[i], a[lt] = a[lt], a[i]
      i += 1
      lt += 1
    else
      a[i], a[gt] = a[gt], a[i]
      gt -= 1
    end
  end

  sort a, lo, lt - 1
  sort a, gt + 1, hi
end

# TEST
three_way_sort [1]
three_way_sort [3, 1]
three_way_sort [1, 3]
three_way_sort [5, 2, 66, 3]
three_way_sort [9, 5, 2, 6, 3]
