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

  def heap_sort
    make_max_heap
    sort
  end

  def make_max_heap
    k = heap.length / 2

    until k < 1
      sink k, heap.length - 1
      k -= 1
    end

    heap
  end

  def sort
    # PRINCIPLE: Root is always largest
    last_pointer = heap.length - 1

    until last_pointer <= 1
      heap[1], heap[last_pointer] = heap[last_pointer], heap[1]
      last_pointer -= 1
      sink 1, last_pointer
    end

    heap.slice 1..-1
  end

  def sink(lo, hi)
    parent = lo
    child = parent * 2

    until child > hi
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

op = Heap.new([0, 1])
op.make_max_heap

h = Heap.new([3, 9, 2, 18, 29, 30, 29, 31, 1, 0, 2])
# h.make_max_heap [nil, 31, 30, 29, 29, 18, 9, 3, 2, 1, 0, 2]
h.heap_sort # [0, 1, 2, 2, 3, 9, 18, 29, 29, 30, 31]
