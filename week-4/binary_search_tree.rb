=begin
  Binary Search Tree (BST)

  A Binary Tree is either:
    - empty
    - 2 disjoin binary trees (left and right) (can hold null links!)

  A Binary SEARCH Tree is a binary tree in symmetric order.
    - Symmetric Order. (Smaller vals on left, bigger vals on right)

  Node:
    - key
    - val
    - reference to left subtree
    - reference to right subtree

  Methods:
    - Search
      1. Compare with current node
      2. if less go left, greater right, equal return. Repeat
      If there is no match, you'll hit a null node. EVERY FINAL LEAF IS NULL!!!
    - Insert (similar to above)
=end

Node = Struct.new(:key, :value, :left, :right)

class BST
  attr_accessor :root

  def initialize(key, value)
    self.root = Node.new(key, value)
  end

  def get(key)
    current = root
    until current.nil?
      if key < node.key
        current = current.left
      elsif key > node.key
        current = current.right
      else
        found_value = current.value
        break
      end
    end
    found_value ||= nil
  end

  def insert(key, value)
    # same as get and then...
    # add or overwrite
  end
end
