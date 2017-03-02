=begin
  STACKS: FILO

  Array Stack Considerations:
    Underflow: Can't remove from empty stack
    Overflow: Can't add to stack at max capacity
    Loitering: In some languages, you have to make sure that removed items can be garbage-collected

    Resizing? DO THIS INFREQUENTLY
      - Increasing Size
        - Bad: Resize array EACH TIME (costly, keep copying arrays). N^2 complexity for inserting first N objects
        - Good: Repeated doubling. When at capacity, create new stack double the size.
      - Decreasing Size
        - Bad: Repeating shrinking. If client "thrashes" (alternate push and pop) right at a shrink/grow mark, it's costly
        - Good: Shrink when the array is only 1/4 full.
      - Cost for PUSH and POP?
        - BEST CASE: 1 operation
        - WORST CASE: N (for grow or shrink)

  Linked List Stack Considerations:
    PROs: Dynamic Memory Allocation
    CONs: Slower look-up, more memory
=end


# Array implementation uses a set size in Java. Simulating here.

class ArrayStack
  attr_accessor :stack, :size

  def initialize(size)
    self.stack = []
    self.size = size
  end

  def push(data)
    raise 'Stack Overflow!' if stack.length >= size
    stack.push data
  end

  def pop
    stack.pop
  end

  def empty?
    stack.any?
  end

  def join(delimiter = " ")
    stack.join delimiter
  end

  def resize
    # see notes above
  end
end

# Test
as = ArrayStack.new 7

as.pop # nothing to pop
as.join
as.push('to')
as.push('be')
as.push('or')
as.join
as.pop
as.push('not')
as.push('to')
as.push('be')
as.push('that')
as.push('is')
as.pop
as.pop
as.pop

as.join # "to be not to"

# (Singly) LINKED LIST STACK
# Appends and pops from FIRST POSITION
# Push and pop from BEGINNING of stack so you don't have to traverse to add!

# PROs: Dynamic Memory Allocation
# CONs: Slower look-up, more memory

class LinkedListStack
  attr_accessor :first

  class Node
    attr_accessor :data, :next_node

    def initialize(data, next_node = nil)
      self.data = data
      self.next_node = next_node
    end
  end

  def push(data)
    self.first = Node.new data, first
    data
  end

  def pop
    if empty?
      puts "nothing to pop"
    else
      old_first = first.next_node
      self.first = old_first
      old_first.data
    end
  end

  def empty?
    first.nil?
  end

  def join(delimiter = " ")
    return "Empty stack" if empty?

    to_print = "#{first.data}"
    current = first.next_node

    until current.nil? do
      to_print = "#{current.data}#{delimiter}".concat(to_print)
      current = current.next_node
    end

    to_print
  end
end

# Test

# test_str = 'to be or - not to be that is - - -'
lls = LinkedListStack.new

lls.pop # nothing to pop
lls.join
lls.push('to')
lls.push('be')
lls.push('or')
lls.join
lls.pop
lls.push('not')
lls.push('to')
lls.push('be')
lls.push('that')
lls.push('is')
lls.pop
lls.pop
lls.pop

lls.join # "to be not to"
