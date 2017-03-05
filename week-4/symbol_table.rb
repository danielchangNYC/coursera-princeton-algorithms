=begin
  Symbol Table is a hash or dictionary.

  Strategies:
  0. Sequential Search. Use a linked list. Costly. Bad.
  1. Uses two binary search trees. One stores keys Other stores values.
    CONS:
      Keeping both in sync
      INSERTION SCALES LINEARLY :(

=end

class SymbolTable
  attr_accessor :keys, :values

  def initialize
    self.keys = []
    self.values = []
  end

  def get(key)
    return if empty?
    i = rank key
    return values[i] if i < keys.length && i == key
    # nil otherwise
  end

  def rank
    lo = 0
    hi = keys.length - 1

    while lo <= hi
      mid = (lo + hi) / 2
      if key < mid
        hi = mid - 1
      elsif key > mid
        lo = mid + 1
      else
        found_idx = mid
        break
      end
    end
    found_idx ||= -1
  end

  def empty?
    keys.empty?
  end
end
