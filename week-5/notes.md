# Week 5: Balanced Search Trees and Geometric Applications

## Balanced Search Trees

### 2-3 Tree

... is a type of BST that...

  1. allows 1 or 2 keys per node
    - 2-node: one key, two children
      - less, greater
    - 3-node: 2 keys, 3 children
      - less, betw, greater
  2. has perfect balance
  3. symmetric (so left is always less, right is always greater, mid is always eq)

#### Insertion

3 cases:

1. Match Found. => Replace val
2. No match; final leaf is 2-node. => Add as a second key
3. No match; final leaf is 3-node. => add key, promote mid, split remaining
    Details:
    - add to key to make 4-node (temp)
    - move middle key in 4-node to parent (to make 2-node)
    - split the rest of the 3-node into two 2-nodes

*** If #3 happens, and you recursively make another 3-node, promote+split again. Could increase height of tree if reaches root.

#### Cost

** Guaranteed logarithmic!
- Search, Insert
  Best: log_3 n
  Worst: log_2 n
CON:
  - very complicated to implement and there's an easier way!

### Red-Black BSTs

... is a type of BST that...

- no node has 2 red links
- every path from root to null has hte same number of black links ("perfect black balance")
- Red links lean left

### B-Trees

... are 2-3 trees except they hold M keys, where M is very large. So you have M-nodes (like 1024-nodes)

- The keys are sorted in an array
- Promote mid-key when array is full, split child into two
  - generally, all nodes will be between half-full and full
- up to M + 1 children per M-node

COST: between log_(m-1) n and log(m/2) N
USES: huge amounts of data (like a file system)
  - Reduce number of "probes" to find a file (probe = first access to a page) (page = a contiguous block of data, e.g. a file or 4096-byte chunk)

IN THE WILD:
  - Windows: NTFS
  - Mac: HFS(+)
  - Linux: Several FS's
  - DBs: Orache, SQL, PostgreSQL, INGRES, DB2

## Geometric Applications

### 1d Range Search

Extends Ordered Symbol Table:
  - Range search: find all keys between a and b
  - Range count

Used for database queries

Geometric Interpretation:
  - Keys are points on a line
  - Find/count points within an interval

Implementation:
  - Recursive tree search, depending on comparison results

#### Line Segment Intersection

*Example of a 1D Range Search*

Given a bounded set of horizontal and vertical line segments, how many intersections are there?

Possible worst cases by strategy:
  - N^2 time (check each line segment against every other one)
  - NLogN (vertical line sweep: N for processing each "swept" event, logN for searches for possible intersection)

### KD (K-dimensional) Trees

*Example of a 2D Range Search*

Extends BST; process points in space

Examples of 2-d orthogonal range search
  1. Given points in a plane and a rectangle drawn in the plane, how many points lie inside the rectangle? (In other words, the intersection is 2-D)
  2. Find closest point to another point

Strategy:
  - Use branches from nodes to represent the different sides of a line (vert or horizontal, alternating) drawn through a point

Notes:
  - Often times we find points in clusters (e.g. flocking birds)
  - Has been used to model the N-body problem

### 1d interval search

Given a set of **intervals**, insert/search

Insert:
  - Use `lo` of range as the BST key
  - also store `hi` of the node AND its subtrees as `max`
Search: (does the interval intersect with another in the tree?)
  - a **intersects** with b iff there is (any) overlap
  - Determine whether to go left or right depending on the `max`
  - R log N run-time

### Orthogonal Rectangle Intersection

Strategy:
  - Sweep search but with interval search tree
  - Linearithmic time
