# Coursera Algorithms

Big Ideas:
  - There's a scientific approach to designing and analyzing algorithms.
    - Build mathematical model of the problem
    - Find algorithm to solve it
    - Evaluate speed and memory (Big O)
    - Iterate improvements

## Union Find

### Dynamic Connectivity Problem

What is the dynamic connectivity problem? It's the model of the union find problem (according to lecture)

PROBLEM (lecture):
  - Given a set of N objects...
    - Union Command: connect two objects
    - Find/connected query: is there a path connecting the two objects?

WIKI SAYS:  a *dynamic connectivity structure* is a data structure that dynamically maintains information about the connected components of a graph

### Union Find Data Structure

- Data Structure
  - METHODS (should have these methods)
    - union (connects p and q)
    - connected (bool)

Union find: is a DATA STRUCTURE
  - It uses a set of algorithms (e.g. the methods listed above) to solve the so called dynamic connectivity problem.
  - WIKI SAYS: “is a data structure that keeps track of a set of elements partitioned into a number of disjoint (nonoverlapping) subsets.”

Reiteration of the dyn conn problem: Given a set of N objects and unions between the objects, how do we find (ie write a find query) whether or not an object is connected to another? **(Existence! Not find THE path)**

In other words, the Union Find Data Structure **defines a data type with the methods we need.**

## Quick Find Algorithm

### The Eager approach (always do the work)

- Big Idea:
  - Each object is assigned a position in the array
  - **Each value at an array index represents the component to which the object is connected.**
    - EX: In [1, 1, 4, 1, 4], indices 0, 1, and 3 are part of the same component.
- METHODS:
  - FIND: Are the component numbers (values) equal? (p == q)
  - UNION: set `array[p]` = `array[q]`, and then iterate through entire array setting anything with the initial `array[p]` to `array[q]`. NOTE: MEMOIZE `array[p]` TO AVOID BUG.
- COST: SLOW (n^2)
  - Initialize: N
  - Union: N
  - find: 1
  - OVERALL COMPLEXITY N^2 (takes N^2 array accesses to process sequence of N union commands on N objects)
- DISADVANTAGES
  - Always N array accesses
  - Trees are flat, but too expensive to keep them flat

## Quick Union Algorithm

### The Lazy approach (avoid doing work until necessary)

- Big Idea:
  - Each object is assigned a position in the array
  - **Each value at an array index represents the object's parent!!!**
    - EX: In [1, 1, 2, 3, 5], Everything is in a tree with root 1, except for the last object which is in its own tree. Index 4 (val === 3) is the grandest-child
    - This is called a tree structure, or a forest (uses many trees)
- METHODS
  - FIND: Do p and q have the same root?
  - UNION: Set id of `p`'s root to `q`'s root. (Sets `p` as a branch of `q`
    - Question: Why not just set `q`'s root to `p`'s index?
  - ROOT: Traverse upwards until the parent === index
- COST
  - Initialize: N
  - Union: N
  - find: N
  - OVERALL COMPLEXITY N^2 (I think!)
- DISADVANTAGES
  - Trees can get tall
    - Find method too expensive (could be N array accesses)

## Weighted Quick Union Algorithm

- Big Idea:
  - Avoid tall trees
  - Keep track of tree sizes
  - **Balance by linking root of smaller tree to larger tree**
    - Reasonable alternatives: Union by height or "rank"
- DATA STRUCTURE
  - Same as quick union but maintains an extra array `size[i]` to count # of objects in the tree rooted at `i`
- METHODS
  - Find: Same as Quick Union
  - Union: Modify quick union to:
    - Link root of smaller tree to bigger
    - Update `sz[]`
- COST
  - Initialize: N
  - Find: lg N
  - Union: lg N
  - OVERALL COMPLEXITY: lg(N) (lg means log base 2)
    - Proposition: Depth of any node x is at most lg N
    - Proof: When does x increase? If a tree with x gets merged into another, the resulting tree doubles in size. This can only happen lg N times (that's how many times you can multiple 2 by itself to get to N).

### Improvement: Path Compression

- Big Idea:
  - Just after computing root of p, set the id of each examined node to point to that root

