# Week 3: Merge sort and Quick sort

## Merge Sort

### Strategy

- Divide array into halves
- Recursively (merge)sort each half
- Merge two halves

In my own words...

To merge sort:
  - Recursively for each range of indices
    - sort the left half
    - sort the right half
    - merge from lo to hi

    - Sorting:
      - return if the lo and hi indices are the same
      - Divide into halves again
      - sort left
      - sort right
      - merges from lo to hi

    - Merging:
      - NOTE: return if hi <= lo
      - NOTE: need to memoize original array state (dup!!!)
      - divide into halves
      - set left and right-side pointers
      - from lo to hi
        - compare pointers
        - if either pointer passes the end of their half, automatically take the other side's value for array[current_index]
        - set array[current_index] to lower one. Increment that pointer.

Variant called Bottom Up Merge Sort which requires more space. Sort pairs, then merge in 4s, 8s, 16s, upwards. Logarithmic passes, Linear comparisons.

Complexity:
  - n lg n
    - linear because comparisons scale linearly
    - logarithmic because of the divided sorting
  - Space: requires at least one auxiliary array. Variant requires more mem.

## Quick Sort

- Shuffle the array
- Partition for some j
  - entry a[j] is in place
  - no larger entry to the left
  - no smaller entry to the right
- Sort each piece recursively
