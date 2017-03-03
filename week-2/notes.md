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

