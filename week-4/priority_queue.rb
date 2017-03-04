=begin
  Priority Queue && HEAPS

  Methods:
    Insert
    Max
    Swim (Promote values)
    Sink (Demote values)

  Strategies:
    1. Unordered array: find max when you need it
      - COST: Insert 1, Delete N
    2. Ordered array: sort on insert.
      - COST: Insert N, Delete 1
    3. Binary Heap
      - a[0] empty. a[1] is the root.
      - Use array indices to represent the tree
        - parent of node at k is at k/2
        - children of node are at 2k and 2k+1
      - PROMOTION: Recursively swap with parent until the heap condition is satisfied
      - DEMOTION: Check children, switch with the one that's larger. Repeat
=end

class PriorityQueue
  attr_accessor :heap # MAX-HEAP

  def initialize
    self.heap = [nil]
  end

  def insert(i)
    len = heap.length
    heap[len] = i
    swim len
  end

  def max
    heap[1]
  end

  def delete_max
    heap.delete_at 1
  end

  def swim(i)
    parent = i / 2
    until heap[i] <= heap[parent] || i <= 1
      heap[i], heap[parent] = heap[parent], heap[i]
      i = parent
      parent = i / 2
    end
  end

  def sink(i)
    child1 = 2i
    child2 = 2i + 1

    until child1 >= heap.length # no children or >= both children
      if heap[child1] > heap[i]
        heap[i], heap[child1] = heap[child1], heap[i]
        i = child1
      elsif child2 >= heap.length
        break
      elsif heap[child2] > heap[i]
        heap[i], heap[child2] = heap[child2], heap[i]
        i = child2
      else # both children are <=
        break
      end

      child1 = 2i
      child2 = 2i + 1
    end
  end

  def empty?
    heap.length <= 1
  end
end

# Test

pq = PriorityQueue.new
