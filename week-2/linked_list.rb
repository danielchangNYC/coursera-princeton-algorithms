class SinglyLinkedList
  class Terminator; end
  class Node
    attr_accessor :data, :reference

    def initialize(data, reference = nil)
      self.data = data
      self.reference = reference
    end

    def next
      self.reference
    end
  end

  attr_accessor :first_node

  def add_node(data)
    if first_node.any?
      last_node.reference = Node.new(data, Terminator)
    else
      self.first_node = Node.new(data, Terminator)
    end
  end

  def remove_node(data)
    last_node = nil
    current_node = first_node

    loop do
      next_node = current_node.next

      if next_node.is_a? Terminator
        break
      elsif data == current_node.data
        last_node && last_node.reference = next_node
        break
      else
        last_node = current_node
        current_node = next_node
      end
    end
end
