CSS (Cascadia Styling Sheet) is the style sheet language that's use to specify how a document written in HTML or XML should be presented and styled.

### CSS Boilerplate

```css
*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
html,body{
    width: 100%;
    height: 100%;
}
```

## How to Link CSS with HTML

Add the line after tittle tag in your html file

`<link rel="stylesheet" href="style.css">`

**Tips:**
- We use `.` dot to target class in CSS
- We use `#` hash to target id in CSS 
- Also if you want to target tag we can simply target like h3{}
- *Div:* box means div and also when e have more than one element and also when there is rectangle shape, very high change there is div ;).

## Units in CSS

1. **px :** It is use to define the measurement in pixels. `1px = 1/96th of inch` 
2. **% :** It is used to define the measurement as a percentage that is relative to another value (maybe to their `parent element`).
3. **vh :** It is relative to the height of the `viewpoint(screen)`. `1vh = 1% or 1/100 of the height of the viewpoint`
4. **vw :** It is relative to the width of the `viewpoint(screen)`. `1vm or 1/100 of the width of the width of viewpoint`
5. **em :** Relative to the font-size of the element `2em means 2 times the size of the current font`
6. **rem :** Relative to font-size of the root element like `html tag`.

*Tip:* There are mainly two type of fonts sans-serif and serif. The difference is the presence of decorative strokes, or serifs at the beginning and end of letters.

**Examples**
<p style="font-family: 'Times New Roman', serif;">
  This text is displayed in a **serif** font (Times New Roman).
</p>
<p style="font-family: Arial, sans-serif;">
  This text is displayed in a **sans-serif** font (Arial).
</p>
## CSS Properties
---
1. `Width:` sets the width of an element.
2. `Height:` Sets the height of an element.
3. `color:` sets the color of text. 
4. `background-color:` specifies the background color of element.
5. `max-width:` sets the maximum width of an element.
6. `max-height:` set the maximum height of an element.
7. `min-width:` sets the minimum width of an element.
8. `min-height:` sets the minimum height of an element. 
9. `font-family:` set/defines a list of fonts for element.
10. `font-weight:` specifies the weight of fonts like *normal*,*bold*, and *bolder(900)*,*thin(100)*
11. `text-transform:` control the capitalization of text like *capitalize*, *uppercase*, *lowercase*, *none*.
12. `text-decoratoin:` specifies the decoration added to text like *underline*, *overline*, *pass-through*
13. `font-size:` specifies the size of font.
14. `line-height:` sets the line height means gap between lines, also we can set numeric like 1,1.2,0.5 or units that we learned before.
15. `text-align:` specifies the horizontal alignment of text like *left*, *right*, *justify*, *center*.
16. `padding:` A shorthand property for all the padding properties. instead we can also use, `padding-top`, `padding-left`, `padding-bottm`, `padding-right`.
17. `margin:` sets all the margin properties in one declaration. we can also like padding uses these `margin-top`,`margin-left`,`margin-bottom`,`margin-right`.

#### Margin VS Padding:
---
- **padding:** padding is the space inside an element, between its content and its border.
- **margin:** margin is the space outside an element, between the element's border and other elements.

<img src="https://images.ctfassets.net/pdf29us7flmy/6FMwLUnze6f6SQjjxpB5lq/4da8905078cce5668a00b488f913340d/-IND-004-082-_When_and_How_To_Use_Margin_vs._Padding_in_CSS_-_Final.png" width="400" height="300" style="display: block; margin: 0 auto;">
18. `border:` A shorthand property for `border-width`, `border-style`, `border-color` *ex:* `border: 3px solid gray`
19. `border-radius:` A shorthand property for the for border `*_radius` properties. We can also add radius on only one corner. like using these properties `border-bottom-left-radius`, `border-bottom-right-radius`,`border-top-left-radius`,`border-top-right-radius` 

#### Block VS Inline VS Inline-Block:
---
**Block Element:-** Start on a new line (occupy full width) and take-up 100% of the width by default. You can set *height*, *width*, *margin*,*padding*. **ex:** `<div>`, `<p>`, `<h1>`.

**Inline Element:-** Do not start on a new line and only take-up as much width as their content/required. Height and width **cannot** be set/change. **ex:** `<span>`,`<a>`,`<strong>`. 

**Inline-Block Element:-** Behave like inline element(do not start on a new line). Allow setting height,width like block elements. Useful for layouts purposes without breaking the flow.**ex:** `<img>`,`button`,`<input>`.

20. `display:` specifies how a certain HTML should be displayed. *attributes:* `block`,`inline`,`inline-block`

#### Position Absolute VS Position Relative:
---
**Position Absolute:-**
- An element with `position: absolute` is removed from the normal document flow.
- It is positioned relative to its nearest positioned ancestor (an ancestor with `position: relative`, `absolute`, or `fixed`). If no such ancestor exists, it is positioned relative to the initial containing block (viewport).
- It does not occupy space in the normal layout, allowing it to move freely within its containing block.

**Position Relative:-**
- An element with `position: relative` remains in the normal document flow.
- It is positioned relative to its **original position**, using `top`, `right`, `bottom`, and `left` values.
- Space for the element is still reserved in the layout, so it affects other elements.
21. `position:` specifies the type of positioning method used for an element `absolute`,`relative`,`fixed`.
#### Background Properties:
---
23. `background:` A shorthand property for all the background properties. It set by `img()`,`color`, `linear-gradiant(to bottom right, red,yellow)` etc.
24. `background-size:` Specifies the size of the background images like `cover`,`contain` etc.
25. `background-repeat:` Sets if/how a background image will be repeated. like `no-repeat`, `round` etc.
26. `background-position:` specifies the position of a background image like `center`,`right`, `left`,`top`,`bottom`.
#### Flexbox:
---
Flexbox is a CSS layout model designed to help arrange elements in a responsive flexible way. It simplifies alignment, distribution, and spacing of items within a container-even when their size is unknown or dynamic. The Flexbox model is one-dimensional, meaning it handles either row or a column layout, Unlike CSS Grid which is two-dimensional(rows and columns).
![](Pasted%20image%2020250121121047.png)

**Key Concepts:**
- *Flex Container:* The parent element that holds flex items. We can define a flex container by applying `display: flex;` to it.
- *Flex items:* The child elements of a flex container that will be laid out according to the flexbox rules.
**Main Axis and Cross Axis:** 
- *Main Axis(x-axis):* This axis along which flex items are placed. It depends on the `flex-direction` property (row by default).
- *Cross Axis(y-axis):* The perpendicular axis to the main axis. for example, if the `flex-direction` is row, the cross axis will be vertical.
27. `display: flex;` Defines the element as flex container.
28. `flex-direction:` Specifies the direction of the main axis like `row`, `column`,`row-reverse`,`column-reverse`.
29. `justify-content:` Aligns items along the main axis like `start`,`center`,`space-between`,`space-evenlly`.
30. `align-items:` Aligns items along the cross-axis `stretch`,`center`, `flex-start`,`flex-end`.

#### Pseudo-Class and Pseudo-Elements:-
---
Pseudo-elements and pseudo-classes are both powerful CSS features used to style elements based on specific states or to target parts of elements that aren't directly available in the DOM, although they serve similar purposes, modifying or styling elements based on conditions, they function differently.
##### Pseudo-Classes:
They targets an element in a specific state, and we use `:` for pseudo-classes.
*Syntax:* `selector:pesudo-class`

**Common Examples:**
- `:hover` when an element is hovered.
- `:focus` when an element is focused.
- `:th-child(n)` targets the nth child of parent.
- `:active` when an element is being clicked.
- `:visited` for visited links

##### Pseudo-Elements:
Targets part of an element or inserts content before/after it. we use `::` for elements.
*Syntax:* `selector::pesudo-element`

