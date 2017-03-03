# Week 2: Stacks, Queues, and Basic Sorting

Focus: Separate interface and implementation (Modular Programming)

## Stacks and Queues

Fundamental data types:

- Value: collection of objects
- Operations: insert, remove, iterate, isEmpty?

Stack: LIFO
Queue: FIFO

### Stacks

Interface:
  - push(string)
  - pop()
  - isEmpty

### Queues

Interface:
  - enqueue
  - dequeue
  - isEmpty

#### What about different types in stacks, not just strings?

Duplicating could be expensive if you have a stack of large objects

Strategies:
  - Bad: Stack per item type (StackOfURLs, StackOfInts, etc)
  - Better: Type-casting for generic `StackOfObjects` (con: this is error-prone and might not be supported in client, and errors at runtime)
  - Even Better: Java generics `Stack<Apple>` => detect error at compile time, not runtime

## Sorting

2 required methods:
  - less (aka comparison)
  - exchange (swap positions)
    - NOTE: without exchange, you don't know that your sorted data is the same as your original

Selection Sort
  - For each idx, swap value with min to the RIGHT side of idx
  - N^2
  - Always goes through ALL elements

Insertion
  - For each idx, keep exchanging to the idx immediately LEFT until finally less
  - Best case scenario is better than Selection, worst is WORSE.
  - Better for already partially-sorted arrays

Shellsort
  - DO TO GAIN EFFICIENCY
  - h-sort: Sort every h values. Use this to partially sort FIRST, then run insertion sort
    - ex do a 7 sort, then a 3 sort, then finally your 1-sort.

Shuffling
  - Knuth Shuffle
    - In iteration i, pick integer r between 0 and 1 uniformly at random
    - Swap a[i] and a[r]
    - COST: N
