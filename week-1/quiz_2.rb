=begin
  QUESTION 2:

  Union-find with specific canonical element. Add a method 𝚏𝚒𝚗𝚍() to the union-find data type so
  that 𝚏𝚒𝚗𝚍(𝚒) returns the largest element in the connected component containing i. The operations,
  𝚞𝚗𝚒𝚘𝚗(), 𝚌𝚘𝚗𝚗𝚎𝚌𝚝𝚎𝚍(), and 𝚏𝚒𝚗𝚍() should all take logarithmic time or better.

  For example, if one of the connected components is {1,2,6,9}, then the 𝚏𝚒𝚗𝚍() method should return
  9 for each of the four elements in the connected components.
=end

class UnionFind
  attr_accessor :roots, :sizes

  def initialize(size)
    self.roots = (0..size - 1).to_a
    self.sizes = Array.new(size, 1)
  end

  def root(i)
    current = i
    if is_own_root? current
      current
    else
      roots[current] = root(roots[current]) # Compression
      roots[current]
    end
  end

  def find_greatest(i)
    # Since roots is  compressed, we can traverse backwards through roots and return first match
    current_root = root i
    roots.reverse.each_with_index do |value, index|
      current_idx = roots.length - index - 1
      break current_idx if root(current_idx) == current_root
    end
  end

  def connected?(i, j)
    root(i) === root(j)
  end

  def union(first, second)
    first_tree_root = root(first)
    second_tree_root = root(second)

    if sizes[first_tree_root] > sizes[second_tree_root]
      roots[second_tree_root] = first_tree_root
      sizes[first_tree_root] += sizes[second_tree_root]
    else
      roots[second_tree_root] = first_tree_root
      sizes[second_tree_root] += sizes[first_tree_root]
    end
  end

  private

  def is_own_root?(i)
    i == roots[i]
  end
end


# Evaluator Script

uf = UnionFind.new(9)
uf.union(4, 1)
uf.union(4, 6)
uf.union(7, 8)
uf.union(4, 7)
uf.find_greatest 1 # => should be 8
