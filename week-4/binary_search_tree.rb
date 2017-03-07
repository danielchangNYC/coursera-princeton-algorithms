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
      Trickier because you have to update the previous node if you make a new one
      - While traversing, also set x.left or x.right equal to the output of the recursed put
        - Doing so, you'll mostly just set to the same node
        - BUT if it's a new node, you have the added benefit of setting that without tracking prev_node
=end

Node = Struct.new(:key, :value, :left, :right)

class BST
  attr_accessor :root

  def get(key)
    current = root
    until current.nil?
      if key < current.key
        current = current.left
      elsif key > current.key
        current = current.right
      else
        found_value = current.value
        break
      end
    end
    found_value ||= nil
  end

  def put(key, value)
    self.root = traverse_and_put(root, key, value)
  end

  def print_tree(current_node = root, depth = 0)
    # parent
    #     └── child.left
    #         └── child.left
    #             └── child.left
    #             └── child.right
    #         └── child.right
    #             └── child.left
    #     └── child.right
    #         └── child.left

    indentation = Array.new(depth, ' ').join.concat('└── ')
    puts "#{indentation} #{current_node && current_node.key || 'nil'}"

    if !current_node.nil?
      depth += 4
      print_tree(current_node.left, depth)
      print_tree(current_node.right, depth)
    end
  end

  def floor(key)
    # ... is the greatest value <= key
    f = traverse_floor key, root
    f.nil? ? nil : f.key
  end

  private

  def traverse_floor(key, node)
    return nil if node.nil?

    if node.key == key
      node
    elsif key < node.key
      traverse_floor key, node.left
    else
      traverse_floor(key, node.right) || node
    end
  end

  def traverse_and_put(current, key, val)
    return Node.new(key, val) if current.nil?

    if key < current.key
      current.left = traverse_and_put(current.left, key, val)
    elsif key > current.key
      current.right = traverse_and_put(current.right, key, val)
    else # equal
      current.value = val
    end

    current
  end
end

# Test

bst = BST.new
bst.put('cat', 5)
bst.put('caat', 5)
bst.put('daat', 5)
bst.put('dabat', 5)
bst.put('banana', 6)
bst.put('caat', 15)
bst.put('baanana', 5)
bst.put('cbat', 15)
bst.put('aapple', 5)
bst.put('apple', 5)

bst.get 'caat'
bst.print_tree

bst.floor('br')
