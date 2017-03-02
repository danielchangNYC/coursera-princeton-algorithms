# FILO

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
