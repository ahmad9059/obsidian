
## Producer

```cpp
while (true) {
    // Produce an item in next_produced
    // ...

    while (counter == BUFFER_SIZE)
        ; // Do nothing (wait if buffer is full)

    buffer[in] = next_produced;
    in = (in + 1) % BUFFER_SIZE;
    counter++;
}

```


## Consumer

```cpp
while (true) {
    while (counter == 0)
        ; // Do nothing (wait if buffer is empty)

    next_consumed = buffer[out];
    out = (out + 1) % BUFFER_SIZE;
    counter--;

    // Consume the item in next_consumed
    // ...
}
```


## Critical Section

```cpp
#include <iostream>
#include <thread>
#include <mutex>
#include <vector>
using namespace std;

mutex mtx;             
int sharedCounter = 0;      
void incrementCounter(int threadID) {
    for (int i = 0; i < 5; i++) {
        mtx.lock();  
        cout << "Thread " << threadID << " is entering critical section.\n";
        sharedCounter++;
        cout << "Thread " << threadID << " incremented counter to " << sharedCounter << "\n";
        cout << "Thread " << threadID << " is leaving critical section.\n";
        mtx.unlock(); 

        this_thread::sleep_for(chrono::milliseconds(100)); 
    }
}

int main() {
    vector<thread> threads;

    for (int i = 1; i <= 3; i++) {
        threads.push_back(thread(incrementCounter, i));
    }

    for (auto &t : threads) {
        t.join();
    }
    cout<<"\n\n!!---All threads have finished execution.--!!\n\n";
    cout << "Final value of sharedCounter: " << sharedCounter << endl;

    return 0;
}
```


## Peterson’s Solution

```cpp
do {
flag[i] = true;
turn = j;
while (flag[j] && turn = = j);
critical section
flag[i] = false;
remainder section
} while (true);
```


## Bakery Algorithm

```cpp
#include <iostream>
#include <thread>
#include <atomic>
#include <vector>
#include <chrono>

using namespace std;

const int N = 2;
atomic<bool> choosing[N];
atomic<int> number[N];

void lock(int id) {
    choosing[id] = true;
    int max = 0;
    for (int i = 0; i < N; ++i)
        max = max > number[i] ? max : number[i];
    number[id] = max + 1;
    choosing[id] = false;

    for (int j = 0; j < N; ++j) {
        while (choosing[j]);
        while (number[j] != 0 && (number[j] < number[id] || (number[j] == number[id] && j < id)));
    }
}

void unlock(int id) {
    number[id] = 0;
}

void process(int id) {
    for (int i = 0; i < 5; ++i) {
        lock(id);
        cout << "Process " << id << " in critical section (iteration " << i + 1 << ")\n";
        this_thread::sleep_for(chrono::milliseconds(500));
        unlock(id);
        cout << "Process " << id << " in remainder section\n";
        this_thread::sleep_for(chrono::milliseconds(500));
    }
}

int main() {
    thread t1(process, 0);
    thread t2(process, 1);
    t1.join();
    t2.join();
    return 0;
}
```


## Semaphore

```cpp
#include <iostream>
#include <thread>
#include <mutex>
#include <condition_variable>

using namespace std;

class Semaphore {
private:
    int count;
    mutex mtx;
    condition_variable cv;

public:
    Semaphore(int init = 0) : count(init) {}

    void wait() {
        unique_lock<mutex> lock(mtx);
        cv.wait(lock, [&] { return count > 0; });
        --count;
    }

    void signal() {
        unique_lock<mutex> lock(mtx);
        ++count;
        cv.notify_one();
    }
};

Semaphore sem(1); // Binary semaphore (like a mutex)

void critical_section(int id) {
    sem.wait();
    cout << "Thread " << id << " is in the critical section\n";
    this_thread::sleep_for(chrono::seconds(1));
    cout << "Thread " << id << " is leaving the critical section\n";
    sem.signal();
}

int main() {
    thread t1(critical_section, 1);
    thread t2(critical_section, 2);

    t1.join();
    t2.join();

    return 0;
}
```


## Readers-Writers Problem in C++


```cpp
#include <iostream>
#include <thread>
#include <mutex>
#include <condition_variable>
#include <chrono>

using namespace std;

mutex mtx;
condition_variable cv;
int readerCount = 0;
bool writerActive = false;

void reader(int id) {
    for (int i = 0; i < 3; i++) {
        {
            unique_lock<mutex> lock(mtx);
            cv.wait(lock, [] { return !writerActive; });
            readerCount++;
        }

        cout << "Reader " << id << " is reading\n";
        this_thread::sleep_for(chrono::milliseconds(500));
        cout << "Reader " << id << " finished reading\n";

        {
            unique_lock<mutex> lock(mtx);
            readerCount--;
            if (readerCount == 0)
                cv.notify_all();
        }

        this_thread::sleep_for(chrono::milliseconds(500));
    }
}

void writer(int id) {
    for (int i = 0; i < 3; i++) {
        {
            unique_lock<mutex> lock(mtx);
            cv.wait(lock, [] { return readerCount == 0 && !writerActive; });
            writerActive = true;
        }

        cout << "Writer " << id << " is writing\n";
        this_thread::sleep_for(chrono::milliseconds(1000));
        cout << "Writer " << id << " finished writing\n";

        {
            unique_lock<mutex> lock(mtx);
            writerActive = false;
            cv.notify_all();
        }

        this_thread::sleep_for(chrono::milliseconds(1000));
    }
}

int main() {
    thread r1(reader, 1);
    thread r2(reader, 2);
    thread w1(writer, 1);
    thread r3(reader, 3);
    thread w2(writer, 2);

    r1.join();
    r2.join();
    w1.join();
    r3.join();
    w2.join();

    return 0;
}
```