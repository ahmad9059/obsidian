**Hashing** is a technique used in data structures that efficiently stores and retrieves data in a way that allows for quick access.

- Hashing involves mapping data to a specific index in a hash table (an array of items) using a **hash function.*** It enables fast retrieval of information based on its key.
- The great thing about hashing is, we can achieve all three operations (search, insert and delete) in O(1) time on average.
- Hashing is mainly used to implement a set of distinct items (only keys) and dictionaries (key value pairs).


The **KMP algorithm**, short for **Knuth-Morris-Pratt algorithm**, is a classic string matching algorithm used in **pattern searching**. It is designed to **efficiently find occurrences of a "pattern" string within a "text" string**, and it does so **without backtracking** in the main string.

1. **Pattern Preprocessing (LPS Array):**
    - KMP precomputes a helper array called **LPS (Longest Prefix which is also a Suffix)**.
    - This array tells us, **when a mismatch happens, how far to shift the pattern** without rechecking already matched characters.
    - It uses the internal structure of the pattern itself to skip unnecessary comparisons.
2. **Efficient Matching:**
    - Instead of comparing the pattern from the beginning every time there's a mismatch, KMP uses the LPS array to continue from where it left off.
    - This prevents repeated work and leads to better performance.

