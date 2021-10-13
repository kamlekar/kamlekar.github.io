---
layout: post
title: Color print the web page
subtitle: ""
date: 2021-05-20 11:59:44.000000000 +05:30
categories:
- technical
tags:
- posts
- color
- print
- canvas
- svg
- web
- page
status: published
type: post
published: true
author: Venkateshwar
header-img: "img/home-bg.jpg"
---

> Disclaimer: Though this article uses Django template as SSR. The concept should work for any SSR.

So, in our project, we had a high priority requirement of letting user to color print the web page having Charts and tables. As the charts were in canvas and canvas shows up in color while printing, this was not an issue. But coming to the Tables, they were printing in black and white though each cell of table was in different color of capsule like background. 


To give more context on the capsule cells in tables:
- These capsules will have different dynamically generated colors.
- These capsules should stretch or shrink as per the text inside it.
- Capsules should not break/wrap into second line but show the text in a single line (_This is gracefully and automatically handled by the tables if we put `white-space: nowrap` to `td` elements_)
- These capsules are `span` elements with text inside it with `white-space: nowrap`.

```css
<td>
    <span class="capsule" style="background-color: #ccc;"> Some text here</span>
</td>
```
Doing some research, we found out the possible ways to color print a page:
- By using color images
- By using Canvas element
- By using SVG element

In our case, using color images is not possible as the capsule color is dynamically generated and could be any hex color value. So, the only way to do was to either go with SVG or Canvas. 

As I know SVG, we decided to try SVG. The idea was to hold the dynamic color inside the SVG as `fill` color instead of CSS `background-color`.  Something like the below code:

```css
<td>
    <span class="capsule">
        <svg width="100%" height="100%" viewBox="0 0 100 100">
            <rect 
                x="0" 
                y="0" 
                width="100" 
                height="100" 
                fill="#CCCCCC" <!-- Using fill to hold the dynamic color value from Django templates -->
            /> 
        </svg>
        Some text here
    </span>
</td>
```


Then to behave the SVG as background, 
- we added `position: absolute` to it and stretch it to the parent container.
- Also to stretch or shrink with the cell, we used  `preserveAspectRatio="xMidYMid slice`
- Also, to make the SVG as capsule, we wrapped the SVG in a `div` wrapper element and used `border-radius` to this wrapper element and put `overflow: hidden`

Doing some research, we found out that the only way to color print the tables is by having an image which is stacked behind the text in the layout using `position: absolute` (_known as "Dummy background"_).  As per our understanding, we thought of the following solutions:
- We were using Django templates. So we thought to create the images on the go using python.
- Ask the designer for the different set of colored images. (_This is not possible in our case as the columns's cell texts and their respective colors were automatically generated and there was no limit to the columns_)
- Use HTML canvas , fill it with the colors and use it as dummy background.

Here is the excerpt code:

```javascript
<td>
    <span class="capsule">
        <div class="capsule--wrapper">
            <svg width="100%" height="100%" viewBox="0 0 100 100">
                <rect 
                    x="0" 
                    y="0" 
                    width="100" 
                    height="100" 
                    fill="#CCCCCC" <!-- Using fill to hold the dynamic color value from Django templates -->
                /> 
            </svg>
            </div>
        Some text here
    </span>
</td>
```

and the CSS:

```css
.capsule {
    position: relative;
    white-space: nowrap;
}

.capsule-wrapper {
    position: absolute;
    left: 0;
    right: 0;
    top: 0;
    bottom: 0;
    border-radius: 99999px;
    overflow: hidden;
}
```
