
- React.js is a JavaScript library for building **user interfaces**.
- Developed by **Facebook** (now Meta) in 2013.
- It is **component-based**, **declarative**, and allows for efficient UI updates.

## Key Features of React

- **Component-Based Architecture**: UI is built using reusable components.
- **Virtual DOM**: Updates only the changed parts, making React fast.
- **Unidirectional Data Flow**: Props and state maintain a predictable data structure.
- **JSX (JavaScript XML)**: A syntax extension that lets you write HTML inside JavaScript.
- **Hooks**: Allow functional components to have state and other features.

## Mutable vs Immutable

### Mutable (Changeable)

- Mutable data types **can be changed** after creation.
- Example: **Objects & Arrays** are mutable.

```js
let arr = [1, 2, 3];
arr.push(4); // Modifies the original array
console.log(arr); // [1, 2, 3, 4]
```

### Immutable (Unchangeable)

- Immutable data **cannot be changed** directly. Instead, you create a new copy.
- Example: **Strings & Numbers** are immutable.

```js
let str = "Hello";
str[0] = "M"; // This won't change the string
console.log(str); // "Hello"
```


Example of immutable object handling (creating a new object instead of modifying the original):

```js
const person = { name: "Ahmad", age: 19 };
const updatedPerson = { ...person, age: 20 };
console.log(updatedPerson); // { name: "Ahmad", age: 20 }
```


## Arrays & Objects Destructuring

### Array Destructuring

- Extract values from an array and assign them to variables.

```js
const numbers = [10, 20, 30];
const [a, b, c] = numbers;
console.log(a, b, c); // 10 20 30
```

### Object Destructuring

```js
const person = { name: "Ahmad", age: 19, city: "Multan" };
const { name, age } = person;
console.log(name, age); // Ahmad 19
```

## Import & Export in JavaScript

### Exporting in JavaScript

##### Named Export (Multiple Exports)

```js
export const name = "Ahmad";
export const age = 19;
export function greet() {
  return "Hello!";
}
```

##### Default Export (Single Export per File)

```js
export default function greet() {
  return "Hello!";
}
```


### Importing in JavaScript

##### Named Import

```js
import { name, age, greet } from "./module.js";
console.log(name, age); // Ahmad 19
console.log(greet()); // Hello!
```

##### Default Import

```js
import greet from "./module.js";
console.log(greet()); // Hello!
```

##### Import Everything

```js
import * as data from "./module.js";
console.log(data.name); // Ahmad
console.log(data.greet()); // Hello!
```

|Concept|Description|
|---|---|
|**Mutable**|Can be changed (Objects, Arrays).|
|**Immutable**|Cannot be changed (Strings, Numbers).|
|**Primitive Types**|Stored by value (`string`, `number`, `boolean`, etc.).|
|**Reference Types**|Stored by reference (`object`, `array`, `function`).|
|**Destructuring**|Extracts values from arrays/objects into variables.|
|**Import/Export**|Used to share JavaScript files/modules.|
|**Spread (`...`)**|Expands arrays/objects into individual values.|
|**Rest (`...`)**|Gathers multiple values into an array.|

## Map & Filter in JavaScript for React


### `map()` Method

- `map()` is used to **iterate** over an array and return a **new array** with modified elements.
- It **does not modify** the original array.

Syntax:

```js
const newArray = array.map((element, index, array) => {
  return modifiedElement;
});
```

Example:

```js
const numbers = [1, 2, 3, 4];
const doubled = numbers.map(num => num * 2);
console.log(doubled); // [2, 4, 6, 8]
```


### `filter()` Method

- `filter()` is used to **filter elements** based on a condition.
- It returns a **new array** with only the elements that satisfy the condition.
- The original array remains **unchanged**.

Syntax:

```js
const newArray = array.filter((element, index, array) => {
  return condition;
});
```

Example:

```js
const numbers = [1, 2, 3, 4, 5, 6];
const evenNumbers = numbers.filter(num => num % 2 === 0);
console.log(evenNumbers); // [2, 4, 6]
```

|Method|Purpose|Returns|
|---|---|---|
|`map()`|Transforms each element in an array|A new array with modified values|
|`filter()`|Selects elements that match a condition|A new array with filtered values|
|`map()` + `filter()`|First filters elements, then transforms them|A new modified and filtered array|

✅ Use **`map()`** to **modify** each element in an array.  
✅ Use **`filter()`** to **remove** unwanted elements from an array.  
✅ **Always use a `key` prop** in React when rendering lists.

## Difference Between Library & Framework


|Feature|**Library**|**Framework**|
|---|---|---|
|**Definition**|A collection of reusable code that helps developers perform specific tasks.|A full-fledged structure that dictates how the code should be organized.|
|**Control**|**You control** when and how to use the library.|The framework **controls** the flow of execution.|
|**Flexibility**|More flexible, can be used with other tools.|Less flexible, enforces a specific architecture.|
|**Example**|React.js (UI library), Lodash, jQuery|Angular, Django, Ruby on Rails|
### Key Difference

- **React (Library)**: You decide how to structure the app.
- **Angular (Framework)**: It dictates the structure.

## Real DOM vs Virtual DOM

### What is the DOM (Document Object Model)?

- The DOM represents the structure of an HTML document as a tree.
- JavaScript can manipulate the DOM to update elements dynamically.

#### What is Real DOM?

- The **actual** structure of an HTML document in the browser.
- When a change is made, **the entire page re-renders**.
- **Slow performance** for frequent updates.

#### What is Virtual DOM?

- A **lightweight copy** of the Real DOM.
- React **updates the Virtual DOM first**, then compares it with the previous version using **diffing**.
- Only the **changed parts** of the Real DOM get updated, making React **much faster**.

### Difference Between Real DOM & Virtual DOM

|Feature|**Real DOM**|**Virtual DOM**|
|---|---|---|
|**Definition**|Actual representation of the webpage.|Lightweight copy of the Real DOM.|
|**Updates**|Directly updates the UI.|Updates in memory first, then syncs with the Real DOM.|
|**Performance**|Slower (entire page re-renders).|Faster (only updates changed parts).|
|**Efficiency**|Expensive updates, slow rendering.|Optimized updates, fast rendering.|
|**Used in**|Vanilla JavaScript, jQuery.|React, Vue.js.|

#### Why Virtual DOM is Important in React?

✅ **Faster updates** compared to Real DOM.  
✅ **Better performance** for dynamic content.  
✅ **Efficient UI rendering** with minimal reflows.


## Vite vs Create React App (CRA) in React.js

### 1. Vite 🚀

- **Modern, fast, and optimized** build tool for React.
- Uses **ES modules (ESM)** and **Hot Module Replacement (HMR)** for instant updates.
- **Super fast startup** (no bundling in development).
- **Supports TypeScript, JSX, and more out-of-the-box**.
- **Tree-shaking & optimized builds** for production.

**Install React with Vite**

```bash
npm create vite@latest
npm install
npm run dev
```


### 2. Create React App (CRA) 🏗️

- Traditional way to set up React projects.
- Uses **Webpack** (slower than Vite).
- **Slower builds** and HMR compared to Vite.
- **Good for beginners**, but outdated for large apps.

**Install React with CRA**

```bash
npx create-react-app my-app
cd my-app
npm start
```


## JSX (JavaScript XML) & React Vite Folder Structure


### 1. JSX (JavaScript XML)

- **JSX** is a syntax extension for JavaScript used in React.
- Looks like **HTML inside JavaScript** but gets converted to JavaScript functions or React.createElement.
- **Allows embedding JavaScript** inside `{}`.
- Must return a **single parent element** (use `<>...</>` if needed).

```js
const App = () => {
  const name = "Ahmad";
  return <h1>Hello, {name}!</h1>;
};
export default App;
```

### 2. React Vite Folder Structure

```js
.
├── eslint.config.js     # ESLint configuration (optional)
├── index.html           # Main HTML file (root of the app)
├── node_modules/        # Installed dependencies
├── package.json         # Project metadata & dependencies
├── package-lock.json    # Exact versions of installed packages
├── public/              # Static assets (images, fonts, etc.)
├── README.md            # Project documentation
├── src/                 # Main source code directory
│   ├── App.jsx          # Main React component
│   ├── main.jsx         # React entry file (renders App)
│   ├── assets/          # Images, styles, etc.
│   ├── components/      # Reusable UI components
│   ├── pages/           # Page components (if using routing)
│   └── styles/          # Global CSS files (if needed)
└── vite.config.js       # Vite configuration file
```

### Key Points

✅ **`src/`** contains all React components & logic.  
✅ **`index.html`** is the main HTML template.  
✅ **Vite uses `main.jsx`** to mount the React app into `#root`.  
✅ **Public files** are served as-is from `/public/`.

## React Components & How They Work

### 1. Component in React

- A **component** is a **reusable, independent UI piece** in React.
- **Two types:**
  - **Functional Components** (recommended, use hooks).
  - **Class Components** (older, uses `this.state`).
- Components **return JSX** and manage their own logic & state.

```js
const MyComponent = () => {
  return <h1>Hello, React!</h1>;
};
export default MyComponent;
```


### 2. How They Work

✅ We **create components** inside the `src/components/` folder (e.g., `MyComponent.jsx`).  
✅ Components **are imported into `App.jsx`**, which acts as the main component.  
✅ **`main.jsx` is responsible for rendering `App.jsx`** inside the root `<div>` in `index.html`.  
✅ **`ReactDOM.createRoot(document.getElementById('root'))`** creates the **Virtual DOM** and syncs

#### Flow of Code in React

1. **Create a component** (`MyComponent.jsx`):

```js
const MyComponent = () => <h1>Hello, React!</h1>;
export default MyComponent;
```

2. **import it inside `App.jsx`**:

```js
import MyComponent from "./components/MyComponent";

const App = () => {
  return (
    <div>
      <MyComponent />
    </div>
  );
};
export default App;
```

3. **Render `App.jsx` inside `main.jsx`**:

```jsx
import React from "react";
import ReactDOM from "react-dom/client";
import App from "./App";

ReactDOM.createRoot(document.getElementById("root")).render(<App />);
```

4. **`index.html` contains `root` div**:

```js
<body>
  <div id="root"></div>
</body>
```

### **Key Points**

✅ **Components are modular & reusable** in React.  
✅ **`main.jsx` renders `App.jsx` inside the `root` div**.  
✅ **React Virtual DOM** updates only changed parts for better performance. 🚀


## Conditional Rendering in React

Conditional rendering in React allows components to render dynamically based on conditions.

**Using if-else Statements**

```jsx
function Greeting(props) {
  if (props.isLoggedIn) {
    return <h1>Welcome Back!</h1>;
  } else {
    return <h1>Please Sign In</h1>;
  }
}
```

**Using Ternary Operator (? :)**

```jsx
function Greeting({ isLoggedIn }) {
  return <h1>{isLoggedIn ? "Welcome Back!" : "Please Sign In"}</h1>;
}
```

## Event Handling in React

React follows the Synthetic Event system, making event handling efficient across different browsers.

**Handling Click Events**

```jsx
function Button() {
  function handleClick() {
    alert("Button Clicked!");
  }

  return <button onClick={handleClick}>Click Me</button>;
}
```


**Passing Arguments in Event Handlers**

```jsx
function Greeting({ name }) {
  function sayHello(name) {
    alert(`Hello, ${name}!`);
  }

  return <button onClick={() => sayHello(name)}>Greet</button>;
}
```

**Handling Keyboard Events**

```jsx
function InputBox() {
  function handleKeyPress(event) {
    if (event.key === "Enter") {
      alert("Enter key pressed!");
    }
  }

  return <input type="text" onKeyPress={handleKeyPress} />;
}
```

✅ **Conditional Rendering:** Use `if-else`, ternary (`? :`), `&&`, or `switch-case` for rendering components based on conditions.  
✅ **Event Handling:** Use event handlers like `onClick`, `onKeyPress`, `onSubmit`, etc., with functions.  
✅ **Pass Parameters:** Use arrow functions for passing arguments in event handlers.  
✅ **Prevent Default Behavior:** Use `event.preventDefault()` to stop default browser actions like form submissions.


## State in React

- State is an object that holds dynamic data that affects a component’s rendering.
- Unlike props, state is **mutable** and can be changed within a component.
- When state changes, React **re-renders** the component to reflect the updates.

### Types of State in React

1. *Local State:*
- Managed within a single component using `useState()`.
- Example: Form inputs, modals, toggles.
2. *Global State:*
- Shared across multiple components.
- Managed using **Context API**, **Redux**, or other state management libraries.
3. *Server State:*
- Data fetched from an API that needs to be integrated into UI.
- Managed using tools like **React Query, SWR, or Redux Thunk**.
4. *URL State:*
- State stored in the **URL** (query parameters, path, etc.).
- Managed using **React Router**.

### Understanding `useState()` Hook

- `useState()` is a React Hook that allows **functional components** to manage state.
- It returns an **array** with two values:
    1. The **current state** value.
    2. A **function** to update the state.

*Syntax:*

```jsx
const [state, setState] = useState(initialValue);
```

*Example: Counter App*

```jsx
import { useState } from "react";

function Counter() {
  const [count, setCount] = useState(0); // Initial state is 0

  return (
    <div>
      <p>Count: {count}</p>
      <button onClick={() => setCount(count + 1)}>Increment</button>
    </div>
  );
}

export default Counter;
```

- `useState(0)`: Initializes `count` to `0`.
- `setCount(count + 1)`: Updates the state, causing a **re-render**.

#### Updating State Correctly

**1. Using Functional Updates (Best Practice)**

- When the new state depends on the previous state, use a function inside `setState()`.

```jsx
setCount((prevCount) => prevCount + 1);
```

- This ensures **correct** updates, especially in **async operations**.

**2. Updating Objects in State**

- Use **spread operator (`...`)** to avoid modifying the original state.

```jsx
const [user, setUser] = useState({ name: "Ahmad", age: 19 });
setUser(prevUser => ({ ...prevUser, age: prevUser.age + 1 }));
```


**3. Updating Arrays in State**

- Use **spread operator (`...`)** to update arrays.

```jsx
const [items, setItems] = useState([1, 2, 3]);
setItems(prevItems => [...prevItems, 4]); // Adds new item
```


✅ **State** is a way to store data inside a component.  
✅ `useState()` is used to manage **local state** in functional components.  
✅ Always **use the updater function** when updating state based on previous values.  
✅ **Never modify state directly**, always use `setState()`.

## Props (Properties) in React

### What are Props?

- **Props** stand for **Properties**.
- Props are **read-only** data passed from a **parent component to a child component**.
- They allow **components to be dynamic and reusable** by passing different data to them.
- Think of props as **function arguments** for components.

## How Props Work

- **Parent component passes props to a child component**.
- **Child component receives them as a parameter** (usually an object).
- The child accesses props using `props.propName`.

## Syntax

### 1. Passing Props

```jsx
<ChildComponent name="Ahmad" age={19} />
```

### 2. Receiving Props

```jsx
function ChildComponent(props) {
  return (
    <div>
      <p>Name: {props.name}</p>
      <p>Age: {props.age}</p>
    </div>
  );
}
```

### ✅ OR Using Destructuring

```jsx
function ChildComponent({ name, age }) {
  return (
    <div>
      <p>Name: {name}</p>
      <p>Age: {age}</p>
    </div>
  );
}
```

## 🧩 Key Points

- **Props are immutable**: You **cannot change** props inside the child component.
- **Unidirectional flow**: Data flows from **parent to child** (one-way data binding).
- **Can be any data type**: String, number, boolean, array, object, function, etc.
- Used to **customize components** and make them reusable.


## CSS Modules

- A **CSS Module** is a **CSS file in which all class and animation names are scoped locally by default**.
- This means that styles defined in one component **won’t affect other components**, preventing style conflicts.
- Used in **React.js** to maintain **modular, reusable, and conflict-free CSS**

###  How It Works

- A CSS file is treated as a module when named with the `.module.css` extension.
  - Example: `MyComponent.module.css`
- In React, you import it as an object where each CSS class becomes a property of that object.

**📄 Example File:** `Button.module.css`

```css
.button {
  background-color: blue;
  color: white;
}
```


### Example Usage in Component

```jsx
import styles from './Button.module.css';

function Button() {
  return <button className={styles.button}>Click me</button>;
}
```


### Behind the Scenes

- CSS Modules use a build tool like **Webpack** to **automatically transform class names** into unique identifiers.
  - Example:
     - `.button` in the source might become `.Button_button__3hWkj` in the final DOM.
- The mapping ensures **local scoping** and uniqueness across components.

### Comparison with Other Styling Methods

|Method|Scoped|Reusable|Global Impact|Setup Required|
|---|---|---|---|---|
|CSS Modules|✅|✅|❌|Minimal|
|Inline Styles|✅|❌|❌|None|
|Global CSS|❌|✅|✅|None|
|CSS-in-JS (e.g. styled-components)|✅|✅|❌|More setup|

##  Form Handling in React.js

**Form handling** refers to how input data is captured from HTML forms (like `<input>`, `<textarea>`, `<select>`) and managed using state or references in React.

#### Key Concepts:

- React forms are usually managed through **state** (controlled) or **refs** (uncontrolled).
- You handle form submissions via an `onSubmit` event handler.
- You use `onChange` to capture input updates.

###  Uncontrolled Components & useRef()

An **uncontrolled component** lets the **DOM manage the input value**, and React accesses it using a `ref`.

- Used to **directly access a DOM element**
- Doesn’t re-render the component on value change

```jsx
const inputRef = useRef();

const handleSubmit = () => {
  console.log(inputRef.current.value);
};

<input type="text" ref={inputRef} />
```


