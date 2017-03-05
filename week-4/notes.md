# Week 4: Priority Queues, Elementary Symbol Tables

## Priority Queues

Remove item of highest priority (min or max)

### HEAPS

A heap is a binary tree with a few special properties:
  1) Shape Property
     - Binary heap is a complete binary tree.
       - This means all nodes of a level must be filled out before moving on to the next
  2) Heap property
     - Conforms to an ordering: all parent nodes will have the same size property in relation to all of its children
     - So, min heap -> all parents will be smaller than children, max heap -> all parents larger than children

## Symbol Tables (aka Associative Arrays, aka Python Dictionaries / Ruby Hashes)

- Given a key, search for the corresponding value
- keys and values can switch "roles" (e.g. lookup by value)
- conventions (for the course?)
  - no null values
  - get returns null if key not present
  - put overwrites existing vals
- should use immutable types for symbol table keys

Methods
  - put(key, value)
  - get(key)
  - delete(key)
  - contains(key)
  - empty?
  - size (# of pairs)
  - keys
