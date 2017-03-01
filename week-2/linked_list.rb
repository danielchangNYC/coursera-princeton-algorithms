class SinglyLinkedList
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

  def find(data)
    last_node = nil
    current_node = first_node

    loop do
      next_node = current_node.next

      if next_node.any?
        break
      elsif data == current_node.data
        break
      else
        last_node = current_node
        current_node = next_node
      end
    end
  end

  def add_to_tail(data)
    if first_node.any?
      last_node.reference = Node.new(data)
    else
      self.first_node = Node.new(data)
    end
  end

  def remove_node(data)
    last_node = find(data)
    last_node.any? ?
      last_node.reference = next_node :
      puts "No node found with data: #{data}"
  end
end
