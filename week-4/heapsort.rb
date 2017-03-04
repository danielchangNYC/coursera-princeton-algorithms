=begin
  Heap Sort

  In-place sort:
    - Create max heap with all N keys
    - Repeatedly remove the maximum and re-sink the left side

  COST:
    - NlogN always. No extra memory either!
    - Inner loop longer than quicksorts
    - Makes poor use of cache memory
    - Not stable!
=end

class Heap
  attr_accessor :heap

  def initialize(heap)
    self.heap = heap.unshift(nil)
  end

  def sort
    make_max_heap
    # sort
  end

  def make_max_heap
    k = heap.length / 2

    until k < 1
      sink k, heap.length - 1
      k -= 1
    end
  end

  def sink(lo, hi)
    parent = lo
    child = parent * 2

    until child >= hi
      if child + 1 <= hi && heap[child + 1] > heap[child]
        child += 1
      end

      break if heap[child] <= heap[parent]
      heap[child], heap[parent] = heap[parent], heap[child]

      parent = child
    end
  end
end

# Test

h = Heap.new([3, 9, 2, 18, 29, 30, 29, 31, 1, 0, 2])
h.make_max_heap
h.sort # [0, 1, 2, 2, 3, 9, 18, 29, 29, 30, 31]
