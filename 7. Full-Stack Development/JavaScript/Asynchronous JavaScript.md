
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


