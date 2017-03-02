=begin
  QUEUES: FIFO

  TODO For ArrayQueue
    Array of set capacity
    Memoize head and tail
    Updating head and tail requires modulo capacity
    Resizing same as stacks
=end

class ArrayQueue
end

# Identical to stack except for push, which pushes to end

class LinkedListQueue
  attr_accessor :first :last

  class Node
    attr_accessor :data, :next_node

    def initialize(data, next_node = nil)
      self.data = data
      self.next_node = next_node
    end
  end

  def push(data)
    next_node = Node.new data

    if empty?
      self.first = next_node
    else
      last.next_node = next_node
    end

    self.last = next_node
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

  # BETTER: Memoize
  # def last
  #   return nil if empty?

  #   current = first

  #   until current.next.nil? do
  #     current = current.next_node
  #   end

  #   current
  # end

  def join(delimiter = " ")
    return "Empty queue" if empty?

    to_print = "#{first.data}"
    current = first.next_node

    until current.nil? do
      to_print = "#{current.data}#{delimiter}".concat(to_print)
      current = current.next_node
    end

    to_print
  end
end
