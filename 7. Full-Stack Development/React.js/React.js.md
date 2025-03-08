
- React.js is a JavaScript library for building **user interfaces**.
- Developed by **Facebook** (now Meta).
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


### **Final Summary**

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
