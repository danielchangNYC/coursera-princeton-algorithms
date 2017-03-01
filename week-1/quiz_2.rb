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
    this.parents = (1..size).to_a
    this.sizes = Array.new(size, 1)
  end

  def root(i)
    current = i
    this.is_own_root? current ? current : this.root current
  end

  def findLargest(i)
    # returns largest element in the connected component containing i
  end

  def connected?(i, j)
    this.root i === this.root j
  end

  def union(first, second)
    firstTreeRoot = root(first)
    secondTreeRoot = root(second)

    if this.sizes[firstTreeRoot] > this.sizes[secondTreeRoot]
      this.parents[secondTreeRoot] = firstTreeRoot
      this.sizes[firstTreeRoot] += this.sizes[secondTreeRoot]
    else
      this.parents[secondTreeRoot] = firstTreeRoot
      this.sizes[secondTreeRoot] += this.sizes[firstTreeRoot]
    end
  end

  private

  def is_own_root?(i)
    current == this.parents[current]
  end
end
