
## Computer Memory

A computer memory system organizes data storage across internal memory (registers, cache, main memory) and external memory (disks, tapes), balancing speed, capacity, and cost.

### Characteristics of Memory Systems

**location**: Location refers to whether memory is internal (like registers, cache, main memory) or external (like hard disks, tapes).  
Internal memory is faster and closer to the CPU, while external memory is slower and used for storage.

**Capacity**: Capacity indicates how much data a memory can store.
For internal memory, it is measured in bytes or words; for external memory, it is usually measured in bytes.

**Word**: A word is the natural unit of memory organization, typically matching the size of an integer or instruction in a system.  
Common word sizes are 8, 16, or 32 bits, but exceptions exist.

**Addressable Units**: Addressable units define the smallest piece of data that can be independently addressed by a memory system.
It can be a word or a byte, depending on the system architecture.

**Unit of Transfer**: The unit of transfer is the number of bits moved into or out of memory at one time. For internal memory, it often matches or exceeds word size; for external memory, it usually involves larger blocks.


### Access Methods

1. **Sequential Access**: Data is accessed in a fixed, linear order.
Example: Magnetic tape, where you must go through data one by one.

2. **Direct Access:** Data can be accessed by moving directly to a general area, then searching within it.
Example: Hard disks.

3. **Random Access:** Any data location can be directly accessed without following a sequence.
Example: RAM (Random Access Memory)

4. **Associative Access:** Data is accessed by matching content rather than by address.
Example: Cache memory searching for a matching tag.


### Performance Metrics

1. **Access Time (Latency):** The time taken to read or write data after a memory address is sent.

2. **Memory Cycle Time:** The total time for a memory to complete one operation and be ready for the next. (Access time + recovery time).

3. **Data Transfer Rate:** The speed at which data is moved into or out of memory.
Measured in bits per second (bps).

### Cost vs Speed vs Capacity Trade-off

1. **Higher Speed ↑ → Higher Cost ↑ → Lower Capacity↓**
- Example: Registers, Cache Memory
- Extremely fast, but very expensive and small in size.

2. **Lower Speed ↓ → Lower Cost ↓→ Higher Capacity ↑**
- Example: Main Memory (RAM), Secondary Storage (Hard Disk, SSD)
- Slower access, but much larger and cheaper.

3. **Smart Memory Design:**
 A well-designed system combines fast, small memory (cache/registers) with slower, larger memory (RAM/disks) to achieve high performance at reasonable cost.


### Locality of Reference

****Temporal Locality***: Temporal Locality means that an instruction that is recently executed has a high chance of execution again. So the instruction is kept in [cache memory](https://www.geeksforgeeks.org/cache-memory-in-computer-organization/) such that it can be fetched easily and takes no time to search for the same instruction.

 ****Spatial Locality***: Spatial Locality means that all those instructions that are stored nearby to the recently executed instruction have a high chance of execution. It refers to the use of data elements(instructions) that are relatively close in storage locations.

|Spatial Locality|Temporal Locality|
|---|---|
|In Spatial Locality, nearby instructions to recently executed instruction are likely to be executed soon.|In Temporal Locality, a recently executed instruction is likely to be executed again very soon.|
|It refers to the tendency of execution which involve a number of memory locations .|It refers to the tendency of execution where memory location that have been used recently have a access.|
|It is also known as locality in space.|It is also known as locality in time.|
|It only refers to data item which are closed together in memory.|It repeatedly refers to same data in short time span.|
|Each time new data comes into execution.|Each time same useful data comes into execution.|
|Example: Data elements accessed in [array](https://www.geeksforgeeks.org/what-is-array/) (where each time different (or just next)  <br>element is being accessing ).|Example: Data elements accessed in loops (where same data elements are accessed multiple times).|


### Cache Addressing

**Cache Addressing:** Cache addressing refers to the method used to determine how memory addresses are mapped into cache locations. It decides whether the cache uses virtual (logical) addresses or physical addresses to store and retrieve data.


1. **Logical Cache (Virtual Cache)**
- Stores data using virtual addresses (before address translation).
- Faster access because it skips the MMU (Memory Management Unit) initially.
- Problem: Same virtual address in different programs can map to different physical addresses → needs careful management during context switches.

2. **Physical Cache**
- Stores data using physical addresses (after translation by the MMU).
- More accurate: No conflicts across processes.
- Slightly slower because address translation must happen before cache access.

### Cache Size Impact

1. **Larger Cache Size**
- Higher hit rate: More data available close to CPU.
- But slightly slower access: Larger caches take more time to search.
- More area needed on chip → more expensive.

2. **Design Trade-off**
- Small Cache:
- ➔ Faster, but may cause more misses.
- Large Cache:
- ➔ Higher hit rate, but slightly slower.

**Note:** Choose cache size that balances speed, cost, and power consumption.


### Replacement Algorithms

Replacement algorithms decide which cache block to remove when new data needs to be loaded into a full cache. Their goal is to maximize cache hits and minimize cache misses for better performance.


#### FIFO (First In, First Out)

FIFO replaces the oldest block in the cache — the one that entered first.

**Key Points:**
- Easy to implement (just a simple queue).
- May not always remove the least useful data.

#### LRU (Least Recently Used)

LRU replaces the block that has not been accessed for the longest time.

**Key Points:**
- Based on temporal locality — recently used data is more likely to be reused.
- Better hit rates compared to FIFO.
- Needs to track recent usage (slightly more complex).

#### LFU (Least Frequently Used)

LFU replaces the block that has been used the least number of times.

Key Points:
- Tracks how many times each block is accessed.
- Good for data that are accessed repeatedly.
- Needs counters for each block.

| Feature / Policy  | FIFO (First-In First-Out)           | LRU (Least Recently Used)                       | LFU (Least Frequently Used)                     |
| ----------------- | ----------------------------------- | ----------------------------------------------- | ----------------------------------------------- |
| Eviction Strategy | Remove the block that entered first | Remove the block that was used longest time ago | Remove the block that was used least frequently |
| Focus             | Insertion time                      | Recency of usage                                | Frequency of usage                              |
| Tracking Needed   | Queue (just order of entry)         | Time or order of last access                    | Count of accesses per block                     |
|                   |                                     |                                                 |                                                 |

### Write Policy Overview

A write policy determines how and when data written to the cache is also updated in the main memory. It directly affects memory consistency, traffic, and system performance.


**Write Through:** In Write Through, every time data is updated in the cache, it is immediately written to the main memory as well.

**Key Points:**
- Main memory always stays up-to-date with the cache.
- Simple to implement and maintain cache coherence.
- Disadvantage: Generates high memory traffic, which can slow down the system.

**Write Back:** In Write Back, data is only written to the main memory when the cache block is replaced.

**Key Points:**
- Dirty Bit:
- ➔ A special bit that marks if a cache block has been modified.
- ➔ If dirty, data must be written back when the block is evicted.
- Reduces memory traffic — faster average performance.
- Disadvantage: Main memory may not always have the most updated data.

**Write Once:** First write to a block is written to both cache and main memory (like write through), but subsequent writes are only made to cache until the block is replaced.

**Key Points:**
- Combines benefits of Write Through and Write Back.
- Reduces memory traffic after the first write.
- Good balance between consistency and performance.

| Feature                     | Write Back                                 | Write Through                         |
| --------------------------- | ------------------------------------------ | ------------------------------------- |
| Data Update                 | Only updated in cache                      | Updated in both cache and main memory |
| Method Complexity           | Simple method                              | Complex method                        |
| When Cache Block is Removed | Cache block is written back to main memory | No need to write back to memory       |
| Reliability                 | Unreliable                                 | Reliable                              |
| Data Redundancy             | No data redundancy                         | Data redundancy exists                |
| Time Efficiency             | No wastage of time                         | Wastage of time                       |
| Cache Coherence             | Cache coherence problem                    | Maintains cache coherence             |


### Number of Caches

Modern computer systems use one or more cache memories to speed up data access between the CPU and main memory. The number of caches impacts the system's speed, efficiency, and cost.

#### Single Level Cache (SLC)

A Single Level Cache system uses one cache memory placed between the CPU and main memory.

**Key Points:**
- Cache stores frequently accessed data and instructions.
- If data is in cache (cache hit), access is very fast.
- If data is missing (cache miss), CPU must access slower main memory.
- Simple design but can become a bottleneck as processor speed increases.

#### Multi-Level Cache (Q-Level Cache)

A Multi-Level Cache system uses two or more caches organized in a hierarchy (like L1, L2, L3) to improve performance.

**Key Points:**
- L1 Cache:
    - Closest to CPU cores.
    - Smallest and fastest.
    - Split into Instruction Cache and Data Cache in some designs.
- L2 Cache:
    - Larger than L1.
    - Slower but still much faster than RAM.
    - Can be private (per core) or shared.
- L3 Cache:
    - Even larger.
    - Slower than L2 but shared among all cores.
    - Helps in multi-core synchronization.


**Main Advantages:**
- Reduces average memory access time.
- Increases CPU performance by reducing stalls and waiting.
- Balances cost, speed, and power consumption.
- Allows scalability in multi-core processors.

| Level | Size                | Speed          | Location           |
| ----- | ------------------- | -------------- | ------------------ |
| L1    | Smallest (~32KB)    | Fastest        | Closest to CPU     |
| L2    | Medium (~256KB–1MB) | Slower than L1 | Near CPU           |
| L3    | Largest (~8MB–32MB) | Slower than L2 | Shared among cores |

### Single Level Cache (SLC) - Detailed Explanation

A Single Level Cache system uses only one cache between the CPU and main memory to store frequently accessed instructions and data.

**Key Points:**
- Fast access to recently used data.
- Simple design: easy to implement and manage.
- Limitations:
    - Becomes a performance bottleneck if cache misses occur.
    - Cannot keep up with modern high-speed processors.
- Used in early computer systems or low-power devices.

### Q-Level Cache (Multi-Level Cache) - Detailed Explanation

A Q-Level Cache system introduces multiple layers of caches (typically L1, L2, and L3) to improve performance and scalability.

**Key Points:**

- L1 Cache:
    - Smallest (about 32KB), fastest, closest to CPU core.
    - Often split into Instruction Cache and Data Cache.
- L2 Cache:
    - Bigger (256KB – 1MB).
    - Slower than L1 but still much faster than main memory.
    - Acts as a backup for L1 cache.
- L3 Cache:
    - Even larger (8MB – 32MB).
    - Shared across multiple CPU cores.
    - Helps reduce bus traffic and improves multi-core performance.

### Trade-offs of Q-Level Cache Design

**Key Trade-offs:**
- **Latency:**
    - Adding more cache levels increases total latency for cache hits at lower levels (e.g., L3).
- **Complexity:**
    - Managing multiple levels requires more sophisticated cache controllers.
- **Area Consumption:**
    - Larger caches consume more chip space, increasing cost and power consumption.


| Cache Level | Size     | Speed                | Shared?                  |
| ----------- | -------- | -------------------- | ------------------------ |
| L1          | Smallest | Fastest              | No (per core)            |
| L2          | Medium   | Slower than L1       | No (per core or private) |
| L3          | Largest  | Slowest among caches | Yes (shared)             |
