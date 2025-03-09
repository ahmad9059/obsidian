
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
npx create-react-app my-app
cd my-app
npm start
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
- Looks like **HTML inside JavaScript** but gets converted to JavaScript functions or create.ReactElement.
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

