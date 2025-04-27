
### **Difference between little-o (o) and little-omega (ω) Notation**

|Aspect|Little-o (o)|Little-omega (ω)|
|---|---|---|
|Meaning|Upper bound **not tight** (grows _much slower_ than)|Lower bound **not tight** (grows _much faster_ than)|
|Formal definition|For every constant **c > 0**, there exists an **n₀** such that **f(n) < c × g(n)** for all **n > n₀**.|For every constant **c > 0**, there exists an **n₀** such that **f(n) > c × g(n)** for all **n > n₀**.|
|Intuition|f(n) becomes _insignificant_ compared to g(n) as n → ∞.|f(n) _dominates_ g(n) heavily as n → ∞.|
|Example|**f(n) = n** is o(n²) because n grows much slower than n².|**f(n) = n²** is ω(n) because n² grows much faster than n.|


### **Loop Invariant in Analysis of Algorithm**

**Definition:**

- A **loop invariant** is a condition that is **true before and after** every iteration of a loop.

**Purpose:**

- Helps **prove correctness** of an algorithm.
- Often used to show that when the loop finishes, the algorithm has done what it was supposed to do.

**How to use it (3 steps):**

1. **Initialization**: True before the loop starts.
2. **Maintenance**: True before and after each iteration.
3. **Termination**: When the loop ends, the invariant helps show that the algorithm is correct.

**Simple Example:** In insertion sort, a loop invariant could be:

> "The subarray before the current index is sorted."

This is true at start (empty array is sorted), stays true after each insert, and at the end proves the whole array is sorted.