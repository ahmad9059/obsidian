
## Producer

```cpp
while (true) {
/* produce an item in next produced */
while (counter == BUFFER_SIZE) ;
/* do nothing */
buffer[in] = next_produced;
in = (in + 1) % BUFFER_SIZE;
counter++;
} 
```


## Consumer

```cpp
while (true) {
while (counter == 0)
; /* do nothing */
next_consumed = buffer[out];
out = (out + 1) % BUFFER_SIZE;
 counter--;
/* consume the item in next consumed */
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


## 


