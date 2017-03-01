=begin
  QUESTION 2:

  Union-find with specific canonical element. Add a method 𝚏𝚒𝚗𝚍() to the union-find data type so
  that 𝚏𝚒𝚗𝚍(𝚒) returns the largest element in the connected component containing i. The operations,
  𝚞𝚗𝚒𝚘𝚗(), 𝚌𝚘𝚗𝚗𝚎𝚌𝚝𝚎𝚍(), and 𝚏𝚒𝚗𝚍() should all take logarithmic time or better.

  For example, if one of the connected components is {1,2,6,9}, then the 𝚏𝚒𝚗𝚍() method should return
  9 for each of the four elements in the connected components.
=end

class UnionFind
  def initialize(size)
    this.ids = (1..size).to_a
  end

  def root(i)
    current = i
    while this.is_own_root? current
      current = this.ids[current]
    end
    current
  end

  def findLargest(i)
    # returns largest element in the connected component containing i
  end

  def connected?(p, q)
    # are p and q connected?
  end

  def union()
    # merge smaller tree from p and q
    # update sizes
  end

  private

  def is_own_root?(i)
    current == this.ids[current]
  end
end
