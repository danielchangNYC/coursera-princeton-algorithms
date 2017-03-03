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
      - divide into halves
      - set left and right-side pointers
      - from lo to hi
        - compare pointers
        - if either pointer passes the end of their half, automatically take the other side's value for array[current_index]
        - set array[current_index] to lower one. Increment that pointer.

## Quick Sort
