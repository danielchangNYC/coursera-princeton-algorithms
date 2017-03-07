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
end