---
layout: post
title: Centering the div's inside a parent div (nested div's)
subtitle:   ""
date: 2013-02-20 08:11:44.000000000 +05:30
categories:
- technical
tags:
- posts
- center
- centering
- css
- div
- html
- nested div
- nested div's
status: publish
type: post
published: true
author: Venkateshwar
header-img: "img/home-bg.jpg"
---
<p>A long time back, a user on <a href="http://stackoverflow.com/q/12636762/1577396">stackoverflow</a> asked a question to center nested child div's inside a parent div. At that time, I stuggled hard for it and atlast got the solution just by using <strong>float:left</strong> and <strong>margin</strong> properties of css.</p>
<p>Here is the HTML code for it:</p>

```javascript
<div class="parent">
   <div class="child_one">
      <div class="child_two">
         <div class="child_three">
            <div class="child_four">
            </div>
         </div>
      </div>
   </div>
</div>
```

<p><strong>CSS</strong></p>

```css
.parent{
    width:500px;
    height:500px;
    background-color:orange;
}
.child_one{
    background-color:purple;
}
.child_two{
    background-color:pink;
}
.child_three{
    background-color:yellow;
}
.child_four{
    background-color:red;
}
div > div {
    margin:10%;
    width:80%;
    height:80%;
    float:left;
}
```

<p>Here is the <a href="http://jsfiddle.net/FUqSP/10/">Fiddle</a> (you can also use <strong>display:inline-block</strong> instead of <strong>float:left</strong> here)</p>
