=begin
  Binary Search Tree (BST)

  COST OF METHODS
    - #keys => N
    - Everything else is log N
      - EXCEPT: Hibbard Delete, which could lead to one-sided imbalanced tree with sqrt(n) height

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

Node = Struct.new(:key, :value, :count, :left, :right)
# count == nodes in subtree

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

  def ceiling(key)
    # ... is the smallest value >= key
    f = traverse_ceiling key, root
    f.nil? ? nil : f.key
  end

  def rank(key)
    # how many nodes where node.key < key? Note: key is not necessarily in the tree
    traverse_rank root, key
  end

  def keys(node = root, queue = [])
    # recursively return all left, then return all right
    return if node.nil?
    keys node.left, queue
    queue.push node.key
    keys node.right, queue
    queue
  end

  def size
    root.count
  end

  def delete(key)
    # Hibbard Deletion Method
    hibbard_delete(key, root)
  end

  def min(node)
    return nil if node.nil?
    return node if node.left.nil?
    min node.left
  end

  private

  def hibbard_delete(key, node)
    return nil if node.nil?

    if key < node.key
      # find match on left side. set with what returns
      node.left = hibbard_delete(key, node.left)
    elsif key > node.key
      # find match on right side. set with what returns
      node.right = hibbard_delete(key, node.right)
    else # found a match!
      # Case 1: No Children
      return nil if node.left.nil? && node.right.nil?

      # Case 2: 1 Child
      return node.right if node.left.nil?
      return node.left if node.right.nil?

      # Case 3: 2 Children
      # replace the node with the minumum of the right child, a.k.a the next largest

      next_largest = hibbard_delete_min node.right
      left = node.left

      if next_largest == node.right
        right = next_largest.right
      else
        right = node.right
      end

      # Set node to next_largest, update its left and right attrs
      node = next_largest
      node.left = left
      node.right = right
    end

    node
  end

  def hibbard_delete_min(node)
    parent = nil

    until node.left.nil?
      parent = node
      node = node.left
    end

    # before swapping (above) point parent.left to the next-smallest, node.right. (traversed to no more leftside already)
    parent.left = node.right if !parent.nil?
    node
  end

  def size_at(node = nil)
    node.nil? ? 0 : node.count
  end

  def traverse_rank(node, key)
    return 0 if node.nil?

    if key == node.key
      size_at node.left
    elsif key < node.key
      traverse_rank node.left, key
    else
      # if key is greater, count this node, all on left, and keep traversing right
      1 + size_at(node.left) + traverse_rank(node.right, key)
    end
  end

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

  def traverse_ceiling(key, node)
    return nil if node.nil?

    if node.key == key
      node
    elsif key < node.key
      traverse_ceiling(key, node.left) || node
    else
      traverse_ceiling key, node.right
    end
  end

  def traverse_and_put(current, key, val)
    return Node.new(key, val, 1) if current.nil?

    if key < current.key
      current.left = traverse_and_put(current.left, key, val)
    elsif key > current.key
      current.right = traverse_and_put(current.right, key, val)
    else # equal
      current.value = val
    end

    current.count = 1 + size_at(current.left) + size_at(current.right)
    current
  end
end

# Test

bst = BST.new
bst.put('cat', 5)
bst.put('dbaabat', 5)
bst.put('caat', 5)
bst.put('daat', 5)
bst.put('dabat', 5)
bst.put('dbabat', 5)
bst.put('banana', 6)
bst.put('caat', 15)
bst.put('baanana', 5)
bst.put('cbat', 15)
bst.put('aapple', 5)
bst.put('apple', 5)

bst.get 'caat'
bst.print_tree

bst.floor('br')
bst.size

bst.rank 'banana'
bst.rank 'ban'
bst.keys

bst.delete('daat')
