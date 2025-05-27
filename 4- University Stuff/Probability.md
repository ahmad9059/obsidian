```markdown
✅ **Q No. 2**  
Two dice are rolled. Let A be the event that the sum of dots is odd and B the event that there is at least one 3 shown. Describe:

- **A ∪ B** (A union B)
- **A ∩ B** (A intersection B)
- **A - B** (A minus B)
- **(A ∩ B')** (A and not B)

Let’s define the events properly.

🟩 **Event A: Sum is odd**  
Sum is odd if one die shows even and the other shows odd. Total such combinations = 18.

```
A = {(1,2), (1,4), (1,6),
     (2,1), (2,3), (2,5),
     (3,2), (3,4), (3,6),
     (4,1), (4,3), (4,5),
     (5,2), (5,4), (5,6),
     (6,1), (6,3), (6,5)}
```

🟨 **Event B: At least one 3 appears**  
Either die shows 3.

```
B = {(1,3), (2,3), (3,3), (4,3), (5,3), (6,3),
     (3,1), (3,2), (3,4), (3,5), (3,6)}
```

Now compute:

🟧 **A ∪ B** (either sum is odd OR at least one 3 appears)  
Union of the above two sets: Include all elements from both without duplication.

```
A ∪ B = A + elements in B that are not in A:

From B, the ones not in A:
(1,3), (3,1), (3,5), (3,3)

So,
A ∪ B = {(1,2), (1,4), (1,6),
         (2,1), (2,3), (2,5),
         (3,2), (3,4), (3,6),
         (4,1), (4,3), (4,5),
         (5,2), (5,4), (5,6),
         (6,1), (6,3), (6,5),
         (1,3), (3,1), (3,5), (3,3)}
```

🟦 **A ∩ B** (both: sum is odd AND at least one 3)  
Elements that are in both A and B:

```
From A and B intersection:
(2,3), (3,2), (4,3), (6,3), (3,4)

So,
A ∩ B = {(2,3), (3,2), (4,3), (6,3), (3,4)}
```

🟥 **A - B** (in A but not in B)  
Take elements of A and remove any that are also in B:

```
A - B = {(1,2), (1,4), (1,6),
         (2,1), (2,5),
         (3,6),
         (4,1), (4,5),
         (5,2), (5,4), (5,6),
         (6,1), (6,5)}
```

🟪 **(A ∩ B')** (A and not B)  
This is the same as A - B, because B' means "not in B".

```
So:
(A ∩ B') = {(1,2), (1,4), (1,6),
            (2,1), (2,5),
            (3,6),
            (4,1), (4,5),
            (5,2), (5,4), (5,6),
            (6,1), (6,5)}
```
```