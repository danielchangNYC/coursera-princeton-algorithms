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
