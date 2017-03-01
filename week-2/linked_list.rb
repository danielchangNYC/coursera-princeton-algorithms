# https://www.cs.cmu.edu/~adamchik/15-121/lectures/Linked%20Lists/linked%20lists.html

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
    prev_node = nil
    current_node = first_node

    while !current_node.nil? && current_node.data != data do
      prev_node = current_node
      current_node = current_node.next
    end

    current_node
  end

  def add_to_tail(data)
    if first_node.any?
      prev_node.reference = Node.new(data)
    else
      self.first_node = Node.new(data)
    end
  end

  def remove_node(data)
    prev_node = nil
    current_node = first_node

    while !current_node.nil? && current_node.data != data do
      prev_node = current_node
      current_node = current_node.next
    end

    current_node.nil? ?
      puts "No node found with data: #{data}" :
      prev_node.reference = current_node.next
  end
end
