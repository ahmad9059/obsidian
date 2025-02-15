## Introduction to GSAP

GSAP(Greensock Animation Platform) is a powerful JavaScript animation library that allows you to create high-performance animations for web applications. It is widely used for animating elements with precision and smoothness.

## 2. Installing GSAP

You can use GSAP in multiple ways:

**CDN**
```html
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"></script>
```

## 3. Basic GSAP Syntax

GSAP uses the `.to()`, `.from()`, and `.fromTo()` methods to animate elements.

- **`gsap.to()`** → Animates from the current state to a new state.

```js
gsap.to(".box", { x: 200, duration: 1 });
```

- **`gsap.from()`** → Animates from a given state to the current state.

```js
gsap.from(".box", { opacity: 0, y: -50, duration: 1 });
```

- **`gsap.fromTo()`** → Specifies both the start and end states explicitly.

```js
gsap.fromTo(".box", { x: 0 }, { x: 300, duration: 1 });
```

## 4. Key Properties

- `x, y` → Move horizontally/vertically
- `scale, scaleX, scaleY` → Scale size
- `rotation, rotate` → Rotate element
- `opacity` → Change transparency
- `skewX, skewY` → Skew transformation
- `stagger` → Create a delay between multiple elements

*Example*

```js
gsap.to(".box", { x: 100, scale: 1.5, rotation: 360, duration: 2 });
```


## 5. Timeline for Sequencing Animations

GSAP’s `gsap.timeline()` helps chain animations in sequence.


```js
let tl = gsap.timeline();
tl.to(".box", { x: 100, duration: 1 })
  .to(".box", { y: 100, duration: 1 })
  .to(".box", { rotation: 360, duration: 1 });
```

## 6. Easing Functions

Easing makes animations feel natural.

```js
gsap.to(".box", { x: 300, duration: 2, ease: "bounce.out" });
gsap.to(".circle", { y: -100, duration: 1, ease: "elastic.out(1, 0.3)" });
```

## 7. Staggering Animations

Use `stagger` to animate multiple elements with delay.

```js
gsap.to(".boxes", { y: 100, duration: 1, stagger: 0.2 });
```


## 8. ScrollTrigger (GSAP Plugin)

To trigger animations on scroll:

*CDN*
```js
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/ScrollTrigger.min.js"></script>
```

Example:

```js
gsap.registerPlugin(ScrollTrigger);

gsap.to(".box", {
  x: 300,
  duration: 2,
  scrollTrigger: {
    trigger: ".box",
    start: "top 80%",
    end: "top 30%",
    scrub: true,
  },
});
```

