=begin

Successor with delete. Given a set of N integers S={0,1,...,n−1} and a sequence of requests of the following form:

Remove x from S
Find the successor of x: the smallest y in S such that y≥x.
design a data type so that all operations (except construction) take logarithmic time or better in the worst case.

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

  def delete(i)
    roots.delete_at i

    # Find the successor of x: the smallest y in S such that y≥x.
    # QUESTION: What do we mean by "successor" here? Is it the smallest ROOT greater than the root of the index just deleted?
    roots[i]
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
uf.delete(4)
