=begin
  Hash Table Implementation: Separate Chaining Hash Symbol Table
    - array of linked lists
      - collision: unshift linked list
    - hashing function: multiply 31*value % array.length

  *** In this example, each node will have both a key and a value.
      I will hash with the key.

  Methods
    get
    put
    hash

  Cost (for Search, Insert, and Delete)
    Worst: lgN
    Avg: 3-5 (constant!)
=end

Node = Struct.new(:key, :value, :next)

class SeparateChainingHashST
  attr_reader :capacity
  attr_accessor :array

  def initialize(capacity)
    @capacity = capacity
    self.array = Array.new(capacity)
  end

  def get(key)
    current = array[hash(key)]

    until current.nil?
      break if current.key == key
      current = current.next
    end

    current && current.value || nil
  end

  def put(key, val)
    i = hash(key)
    current = array[i]

    if array[i].nil?
      array[i] = Node.new(key, val)
    else
      until current.nil?
        if current.key == key
          current.value = val
          break
        end
        current = current.next
      end

      if current.nil?
        array[i] = Node.new(key, val, array[i])
      end
    end
  end

  private

  def hash(key)
    key.hash.abs % capacity
  end
end

# Test

ht = SeparateChainingHashST.new(5)

ht.put('dog', 1)
ht.put('dozg', 1)
ht.put('dog', 65) # replaces dog
ht.put('dogds', 1)
ht.put('dobg', 1)
ht.put('dogd', 1)
ht.put('dogj', 1)
ht.put('doga', 1)
ht.put('dogn', 1)
ht.put('dognm', 1)
ht.put('dognl', 1)
ht.put('dognwe', 1)
ht.put('doasdfgn', 1)
ht.put('asdf', 1)
ht.put('fdsa', 1)
ht.put('4i2hg', 1)
ht.put('asdf', 1)
ht.put('ubiue', 1)
