=begin
  Red Black BSTs (type of 2-3 tree represents 3-nodes with "red links")

  This implementation is a "Left-leaning red-black tree"

  Represents a 3-node using 2 roots
    - larger key is the parent
      - its right child is GREATER
    - smaller key is the child
      - its left child is LESS
      - its right child is BETWEEN parent and child root

  ***** KEY IDEA *****
  The "right side" of the smaller root of the 3-node still follows the right-side-larger rule!
  This means that the BST now benefits from BALANCE without a complicated 3-node implementation

  Just make sure we maintain balance properties on insert!
  ********************

  Rules
    1. No node has 2 red links
    2. Every path from root to null link has same number of black links
    3. Red links lean left (aka NO right-leaning red links)
=end

Node = Struct.new(:key, :value, :count, :left, :right, :red)

class RBTree
  attr_accessor :root

  def get(key)
    # Same as elementary BST!
    current = root
    until root.nil?
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

  def insert(key)
  end

  def rotate_left(node)
    # sometimes nodes will lean right during insertion
    # this method orients a right-leaning red link to lean left
    # Strategy: switch the "between" node, switch the colors
      # parent also needs to update. happens in caller (e.g. parent.left = rotate_left(parent.left))

    red_right = node.right
    node.right = red_right.left # set to between-node
    red_right.left = node

    red_right.red = false
    node.red = true
    red_right
  end

  def rotate_right(node)
    red_left = node.left
    node.left = red_left.right # set to between-node
    red_left.right = node

    red_left.red = false
    node.red = true
    red_left
  end

  def flip_colors(node) # node is the middle key of a 4-node
    # => Recolor to split a 4-node into two 2-nodes
    # Idea: Merge node with parent

    # For this to be a 4-node, both children of node have red-links
    node.red = true
    node.left.red = false
    node.right.red = false
  end

  def red?(node)
    return if node.nil?
    !!node.red
  end
end
