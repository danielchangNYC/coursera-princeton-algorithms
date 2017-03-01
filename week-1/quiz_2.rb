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

  def findGreatest(i)
    # returns largest element in the connected component containing i

    # Strategy: Add compression. That way, you can start with this.parents.last and check if the root matches
  end

  def connected?(i, j)
    this.root i === this.root j
  end

  def union(first, second)
    first_tree_root = root(first)
    second_tree_root = root(second)

    if this.sizes[first_tree_root] > this.sizes[second_tree_root]
      this.parents[second_tree_root] = first_tree_root
      this.sizes[first_tree_root] += this.sizes[second_tree_root]
    else
      this.parents[second_tree_root] = first_tree_root
      this.sizes[second_tree_root] += this.sizes[first_tree_root]
    end
  end

  private

  def is_own_root?(i)
    current == this.parents[current]
  end
end
