
## Synchronous vs Asynchronous JavaScript

JavaScript is **single-threaded**, meaning it executes one operation at a time in a sequential manner. However, JavaScript provides mechanisms to handle tasks asynchronously, allowing it to perform operations without blocking the main execution thread.

## 1. Synchronous JavaScript

In **synchronous execution**, tasks run one after another, meaning JavaScript waits for one operation to complete before moving to the next. This can cause delays if a task takes a long time (e.g., reading a large file or making a network request).

Example:

```js
console.log("Start");
function syncFunction() {
    console.log("Processing...");
}
syncFunction();
console.log("End");
```

Here, JavaScript executes statements **one by one in order**, blocking execution until each task is completed.

## 2. Asynchronous JavaScript

Asynchronous JavaScript allows tasks to run in the **background** without blocking the execution of other tasks. This is useful for operations like **fetching data from an API, reading files, or handling timers**.

- **Does NOT wait** for one task to complete before moving to the next.
- Allows JavaScript to handle **time-consuming operations (API calls, file reads, etc.)** efficiently.
- Uses the **Event Loop** to manage [async]() tasks.
### How Asynchronous JavaScript Works

JavaScript uses the **Event Loop** and the **Call Stack** to handle asynchronous code efficiently. It uses:

- **Callbacks(setTimeout,setInterval)**
- **Fetch API**
- **Axios**
- **Promises**
- **Async/Await**

### Callbacks
A **callback function** is passed as an argument to be executed later.

```js
console.log("Start of program");
// setTimeout: Delays execution by 3 seconds
setTimeout(() => {
    console.log("setTimeout: This runs after 3 seconds");
}, 3000);
// setInterval: Runs every 2 seconds
let counter = 0;
let intervalID = setInterval(() => {
    counter++;
    console.log(`setInterval: Counter is ${counter}`);
    // Stop interval after 5 executions
    if (counter === 5) {
        clearInterval(intervalID);
        console.log("clearInterval: Stopped interval after 5 executions");
    }
}, 2000);
console.log("End of program (before timeouts and intervals execute)");
```



