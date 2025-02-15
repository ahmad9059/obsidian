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
gsap.to(".box", {  // Animates the element with class "box"
  x: 300,          // Moves the element 300 pixels to the right
  duration: 2,     // Animation lasts for 2 seconds
  scrollTrigger: { // Uses the ScrollTrigger plugin to trigger animation on scroll
    trigger: ".box",   // The animation starts when the ".box" element enters the viewport
    scroller: "body",  // Specifies the scrolling container (default is "body")
    markers: true,     // Displays visual markers (start and end points) for debugging
    start: "top 80%",  // Animation starts when the top of ".box" reaches 80% of the viewport height
    end: "top 30%",    // Animation ends when the top of ".box" reaches 30% of the viewport height
    scrub: true,       // Makes the animation progress smoothly with scrolling
  }
});
```

### Explanation of ScrollTrigger Properties

|**Property**|**Description**|
|---|---|
|`trigger`|Defines which element should trigger the animation when it enters/exits the viewport.|
|`scroller`|Specifies the scrollable container (default is `body`). Useful when working with scrollable divs.|
|`markers`|Adds visual markers to indicate where the animation starts and ends (for debugging).|
|`start`|Defines when the animation starts. `"top 80%"` means when the top of `.box` reaches 80% of the viewport height.|
|`end`|Defines when the animation ends. `"top 30%"` means when the top of `.box` reaches 30% of the viewport height.|
|`scrub`|Syncs the animation with the scroll position. If `true`, the animation plays forward and backward as the user scrolls.|


