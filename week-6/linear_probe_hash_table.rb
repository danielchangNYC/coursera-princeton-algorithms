=begin
  Linear Probe Hash Table

  *** ARRAY SIZE MUST BE > NUMBER OF NODES
  *** Arrays resize as it grows fuller. Ideally, it's only half full.

  Strategy
    Insert
      - Hash to find insertion idx
        - If collision, try idx + 1 and so forth.
        - If found, overwrite.
        - If we hit an open array slot, insert there
    Search
      - Hash to find insertion idx
        - Search there. Increment +1 until found, or no match.

  Cost
    Constant

  Gotchas
    - Array needs to resize as it grows
    - Sensitive to hashing fn. Could result in clustering (unequal chance of hashing to any idx)
=end

Node = Struct.new(:key, :val)

class LinearProbeHashTable
  attr_accessor :array

  def initialize
    self.array = Array.new 10
  end

  def get(key)
    idx = hash key
    idx = idx + 1 % array.length until array[idx].nil? || array[idx].key == key
    array[idx] && array[idx].key == key && array[idx].val
  end

  def insert(key, val)
    idx = hash key

    idx = idx + 1 % array.length until array[idx].nil? || array[idx].key == key

    if array[idx].nil?
      array[idx] = Node.new(key, val)
    else
      array[idx].val = val
    end
  end

  private

  def hash(key)
    key.hash.abs % array.length
  end
end

# Test

ht = LinearProbeHashTable.new
ht.insert('dog', 1)
ht.insert('cat', 1)
ht.insert('dog', 2)
