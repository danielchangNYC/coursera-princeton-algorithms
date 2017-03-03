=begin
  Look for kth term

  STRATEGY: Partition array so that
    - Entry a[j] is in place
    - No larger entry to left of j
    - No smaller to right
    *** REPEAT IN ONE SUB ARRAY, depending on whether j == k

  COST:
    Quadratic worst case (but soooo unlikely with shuffle)
    Linear time, worst case (2N compares)
=end

def quick_select(a, k)
  if k > a.length || k < 1
    puts "#{k} must be a natural number <= array size"
    return
  end

  a.shuffle!

  term = select(a, k-1, 0, a.length - 1)
  p "The kth term for k=#{k} is #{term}"
end

def select(a, k, lo, hi)
  j = rearrange(a, lo, hi)
  if j == k
    a[j]
  elsif j < k
    select a, k, j+1, hi
  else
    select a, k, lo, j-1
  end
end

def rearrange(a, lo, hi)
  i = lo
  j = hi

  loop do
    i += 1 until a[i] > a[lo] || i >= hi
    j -= 1 until a[j] < a[lo] || j <= lo
    break if i >= j
    a[i], a[j] = a[j], a[i]
  end

  a[lo], a[j] = a[j], a[lo]
  j
end

# Test

quick_select [4, 6, 11, 7], 3 # 7
quick_select [14, 6, 11, 7], 3 # 11
quick_select [14, 6], 3 # nil
quick_select [14], 1 # 14
quick_select [14], 0 # nil
