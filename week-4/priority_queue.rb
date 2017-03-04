=begin
  Priority Queue && HEAPS

  Methods:
    Insert
    Max
    Swim (Promote values)
    Sink (Demote values)
    Remove Max (Switch root with last, remove old root, and then sink the root)

  Strategies:
    1. Unordered array: find max when you need it
      - COST: Insert 1, Delete N
    2. Ordered array: sort on insert.
      - COST: Insert N, Delete 1
    3. Binary Heap
      - COST: Insert LogN, Delete LogN
      - STRATEGY: Heap
        - a[0] empty. a[1] is the root.
        - Use array indices to represent the tree
          - parent of node at k is at k/2
          - children of node are at 2k and 2k+1
        - PROMOTION: Recursively swap with parent until the heap condition is satisfied
        - DEMOTION: Check children, switch with the one that's larger. Repeat
      - IMPROVEMENTS
        - Use immutable keys! So client can't change them
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
    return heap[1] if heap.length == 2
    heap[1], heap[heap.length - 1] = heap[heap.length - 1], heap[1]
    heap.pop
    sink 1
  end

  def empty?
    heap.length <= 1
  end

  def swim(i)
    parent = i / 2
    until (i <= 1) || (heap[i] <= heap[parent])
      heap[i], heap[parent] = heap[parent], heap[i]
      i = parent
      parent = i / 2
    end
  end

  def sink(k)
    parent = k
    child = 2 * parent

    until child >= heap.length
      # Promote the better child
      if child + 1 < heap.length && heap[child] < heap[child + 1]
        child += 1
      end

      break if heap[parent] > heap[child]
      heap[parent], heap[child] = heap[child], heap[parent]

      parent = child
      child = 2 * parent
    end
  end
end

# Test

queue = PriorityQueue.new
queue.insert 1
queue.insert 29
queue.insert 10
queue.insert 4
queue.insert 3
queue.insert 2
queue.insert 31
queue.insert 22
queue.insert 29
queue.insert 30
queue.insert 60
queue.delete_max
queue.delete_max
queue.delete_max

p queue.heap
