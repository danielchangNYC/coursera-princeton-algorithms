# Week 6: Hash Tables and Symbol Table Applications

## Hash Tables

... is a symbol table that uses a *hashing function* to insert, del, and lookup
**Must deal with collisions** (unless you have an array large enough for everything, but practically this never happens.)

Compared to BST? **Better performance IF we don't need ordered ops**

Issues?
  - Computing the **HASH FUNCTION**
  - Equality test: Method for checking whether two keys are equal
  - **COLLISION RESOLUTION**: Algorithm and data structure to handle two keys tha thash to the same array index
  - Load balancing

Class space-time tradeoff:
  - No space limitation: trivial hash function with key as index (ie. array is huge)
  - No time limitation: trivial collision resolution with sequential search (ie. lookup N)
  - Space and time limitations: hashing (ie. the real world)

### Hashing Function

Ideal:
  - Efficient computing
  - Each table idx equally likely for each key
    - Ex 1: phone numbers, area code isn't good. Last 3 digits better.
    - Ex 2: SSN, first three are bad (assigned in chron order). Last 3 better.
Challenges:
  - Need different approach for every key type

Hash fn: returns int between 0 and M-1 (for use as array index) (typically power of 2)

```ruby
def hash(key)
  key.hashCode.abs % M
end
```

### Hash Code

"Standard" recipe for user-defined types:
  - Combine all significant fields/attrs to create hash
  - 31*x + y, where x is a hashing constant (e.g. 17) and y is the sum of `hashCode`s for the other attrs. If array, apply to each entry (`deepHashCode`)

  ^^ In practice, this recipe works well and is used in Java libs

### Collision Handling Strategy 1: Separate Chaining

Separate chaining symbol table
  - *array of linked lists*
  - hashing fn => maps key to integer i in hash table

### Collision Handling Strategy 2: Linear Probing

## ST Applications
