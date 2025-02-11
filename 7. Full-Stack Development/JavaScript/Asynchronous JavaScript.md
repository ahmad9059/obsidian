
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
A **callback function** is passed as an argument to be executed later.given example use the both setTimeout and setInterval and clearInterval to stop the setInterval

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

### Fetch API

The `fetch()` API is **asynchronous** because it makes network requests **without blocking** the execution of other code. It **returns a Promise**, which resolves when the request completes.

```js
fetch("https://jsonplaceholder.typicode.com/todos/1") // Fetch data from API
  .then((response) => response.json()) // Convert response to JSON
  .then((data) => console.log(data)) // Log the data
  .catch((error) => console.error("Error fetching data:", error));
```

🔹 **How it works?** 1️⃣ `fetch()` makes an HTTP request **(returns a Promise).**  
2️⃣ `.json()` parses the response into JavaScript object **(also async, returns a Promise).**  
3️⃣ `.then()` handles the resolved data.  
4️⃣ `.catch()` handles errors (e.g., network failure).

### Axios

**Axios is asynchronous** because it makes network requests **without blocking** execution. It is built on top of JavaScript Promises, similar to `fetch()`, but with more features.

**Why use Axios?**

- **No need to manually parse JSON** (Axios does it automatically).
- **Better error handling** (Fetch only rejects on network errors, while Axios rejects on HTTP errors too).
- **More readable with async/await**.

```js
axios.get("https://jsonplaceholder.typicode.com/todos/1")
    .then(response => console.log(response.data)) // Axios auto-parses JSON
    .catch(error => console.error("Error fetching data:", error));
```

### 🔥 Comparison: Axios vs. Fetch

|Feature|Axios|Fetch|
|---|---|---|
|JSON Parsing|✅ Auto|❌ Manual (`.json()`)|
|Error Handling|✅ Rejects on HTTP errors|❌ Only rejects on network errors|
|Request Headers|✅ Easy|❌ Manual setup required|
|`async/await` Support|✅ Yes|✅ Yes|
|Default Timeout|✅ Yes (`timeout` option)|❌ No|

**👉 Best Practice:** Use **Axios** when working with APIs that require headers, authentication, or advanced error handling.

## Promise in JavaScript

A **Promise** in JavaScript is an object that represents the eventual **completion (or failure)** of an asynchronous operation.

👉 It has **three states**:

1. **Pending** → Initial state, neither resolved nor rejected.
2. **Fulfilled** → Operation completed successfully.
3. **Rejected** → Operation failed.


```js
fetch(`https://randomuser.me/api/`)
  .then(raw => raw.json())
  .then(result =>{
      console.log(result.results[0].gender);
      if(result.results[0].gender === "male"){
        resolve();
      }
      else{
       reject(); 
      }
    });

});
promise
.then(function(){
    console.log("Male Received");
  })
.catch(function(){
    console.log("Female Received");
  })

```

## Callbacks in JavaScript

A **callback** is a **function passed as an argument** to another function and executed later.  
👉 **Why use callbacks?**

- Handle **asynchronous operations** (like fetching data, timers, or reading files).
- Execute **code after another function completes**.


```js
function getData(url, callback) {
  fetch(`https://randomuser.me/api/`)
    .then((raw) => raw.json())
    .then((result) => {
      callback(result);
    });
}

getData("https://randomuser.me/api/", function (result) {
  console.log(
    result.results[0].gender,
    result.results[0].name.first,
    result.results[0].email,
  );
});
```


## async/await

`async/await` is a modern **way to handle asynchronous code** in JavaScript.  
It allows you to write **asynchronous code** in a way that looks **synchronous**, making it **easier to read and debug**.

👉 **Key Features:**  
✔️ **`async`: **The `async` keyword is used **before a function definition** to make it return a **Promise**.
✔️ **`await`:** The `await` keyword is used **inside an `async` function** to pause execution **until a Promise resolves**.
✔️ **Avoids callback hell** and complex `.then()` chains.  
✔️ **Handles errors** with `try/catch`.

```js
async function func() {
  let n = await fetch(`https://randomuser.me/api/`);
  n = await n.json();
  console.log(n.results[0].gender);
}
func();
```

### When to Use `async/await`?

✔️ **Fetching data from an API**  
✔️ **Performing database queries**  
✔️ **Reading/Writing files (in Node.js)**  
✔️ **Processing multiple async requests together**  
✔️ **Avoiding callback hell**

## Event Loop

To understand the Event Loop, you need to know how JavaScript executes code. It has three main components:

### Call Stack

- The **Call Stack** follows the **LIFO (Last In, First Out)** principle.
- It executes **synchronous** JavaScript code **line by line**.

```js
function greet() {
    console.log("Hello!");
}
greet();
```

📌 **Execution:**

1. `greet()` is **pushed** onto the **Call Stack**.
2. `console.log("Hello!")` runs and is **popped** from the stack.

### Web APIs (Async Tasks)

- JavaScript **delegates async tasks** (e.g., `setTimeout`, `fetch`, event listeners) to **Web APIs**.
- These APIs handle the task in the **background** and **return the result later**.

Example:

```js
console.log("Start");
setTimeout(() => {
    console.log("Inside setTimeout");
}, 1000);

console.log("End");
```

📌 **Execution Flow:**

1. `console.log("Start")` → **Executes immediately**.
2. `setTimeout()` → **Sent to Web API, NOT executed immediately**.
3. `console.log("End")` → **Executes immediately**.
4. After 1 second, the callback (`console.log("Inside setTimeout")`) moves to **Callback Queue**.

### Callback Queue & Microtask Queue

- **Callback Queue:** Stores callbacks from **setTimeout, setInterval, event listeners**.
- **Microtask Queue:** Stores callbacks from **Promises (`.then()`, `catch()`, `finally()`) and `MutationObserver`**.
- **Microtasks always run before Callbacks** (higher priority).

Example:

```js
console.log("Start");
setTimeout(() => console.log("Timeout Callback"), 0);
Promise.resolve().then(() => console.log("Promise Resolved"));
console.log("End");
```

📌 **Execution Flow:**

1. `console.log("Start")` → **Runs immediately**.
2. `setTimeout()` → **Sent to Web API** (callback moved to Callback Queue).
3. `Promise.resolve().then(...)` → **Sent to Microtask Queue**.
4. `console.log("End")` → **Runs immediately**.
5. **Microtask Queue executes first** → `console.log("Promise Resolved")`.
6. **Callback Queue executes** → `console.log("Timeout Callback")`.

