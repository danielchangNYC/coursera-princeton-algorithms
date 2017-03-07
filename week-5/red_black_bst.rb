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

Node = Struct.new(:key, :value, :red, :left, :right)

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

  def put(key, val)
    self.root = traverse_and_put root, key, val
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

  private

  def traverse_and_put(current, key, val)
    ######### Red-Black BST cases for red-links ###########

    # Case 0: key found. replace val

    # Case 1: insert into a 2-node (makes 3-node)
      # 1. Insert w red-link (same as BST insert)
      # 1a. if greater, then will have to rotate_left

    # Case 2: insert into 3-node (makes 4-node)
      # 1. Insert node w red-link (same as BST insert)
      # 2. Rotate to balance 4-node, if needed
        # => IF LARGER: Now have left && right red-links. Ready for flip / do nothing.
        # => IF SMALLER: Now have left && left.left red-links. rotate_right(node)
        # => IF BETWEEN: Now have left && left.right red-links. rotate_left(left) and rotate_right(node)
      # 3. Flip at current_mid
      # 4. Rotate to make lean-left, if needed (happens if promotion was to a right-node. must switch to make left again)
      # 5. REPEAT CASE 1 OR 2 UP THE TREE IF NEEDED

    # Same code handles all cases:
      # left black && right red => ROTATE LEFT
      # left red && left.left red => ROTATE RIGHT
      # left red && right red => FLIP

    #######################################################

    ### 1. BST INSERT ###
    return Node.new(key, val, true) if current.nil?

    if key < current.key
      current.left = traverse_and_put(current.left, key, val)
    elsif key > current.key
      current.right = traverse_and_put(current.right, key, val)
    else # equal
      current.value = val
    end

    ### 2. Update Links ###
      # (same from above:)
      # left black && right red => ROTATE LEFT
      # left red && left.left red => ROTATE RIGHT
      # left red && right red => FLIP

    rotate_left(node) if leans_right? node
    rotate_right(node) if left_double_red? node
    flip_colors(node) if four_node_mid? node
    # Note: left-red, left.right-red will be taken care of recursively.
    # Only happens on promotion during flip_colors

    current
  end

  def leans_right?(node)
    !red?(node.left) && red?(node.right)
  end

  def left_double_red?(node)
    red?(node.left) && node.left.left && red?(node.left.left)
  end

  def four_node_mid?(node)
    red?(node.left) && red?(node.right)
  end
end
