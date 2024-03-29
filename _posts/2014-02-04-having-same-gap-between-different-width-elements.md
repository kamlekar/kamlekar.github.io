---
layout: post
title: Having same gap between different width elements
date: 2014-02-04 09:16:58.000000000 +05:30
categories:
- technical
tags:
- posts
- different widths
- javascript
- same gap
status: publish
type: post
published: true
author: Venkateshwar
header-img: "img/home-bg.jpg"
---
<p>I created code for keeping a fixed gap among the elements even when the width of each element is different. There seems not much to be explained. please comment below if you can't understand anything.</p>
<p><strong>HTML</strong></p>

```css
<div class="row" id="row1">
    <div class="box" id="box1"></div>
    <div class="box" id="box2"></div>
    <div class="box" id="box3"></div>
</div>
```

<p><strong>CSS</strong></p>

```css
div {
    font-size: 0;
}
#row1>div {
    position: absolute;
    height: 100px;
}
#box1 {
    width: 50px;
    background-color: red;
}
#box2 {
    width: 90px;
    background-color: blue;
}
#box3 {
    width: 50px;
    background-color: green;
}

 #row1 {
    width: 500px;
    background-color: #DCDCDC;
    height: 100px;
    position: relative;
}
```

<p><strong>Javascript</strong></p>

```javascript
function setAlign(parentClass, childCommonClass) {
    var childDivs = document.getElementsByClassName(childCommonClass);
    var childDivsTotalWidth = 0;
    var childDivsLength = childDivs.length;
    var parentElement = document.getElementsByClassName(parentClass)[0];
    var parentElementWidth = parentElement.offsetWidth;
    for (var i = 0; i < childDivsLength; i++) {
        childDivsTotalWidth += childDivs[i].offsetWidth;
    }
    var remainingWidth = parentElementWidth - childDivsTotalWidth;

    var gap = remainingWidth / (childDivsLength + 1);
    var leftWidth = gap;
    for (var j = 0; j < childDivsLength; j++) {
        if (j > 0) {
            leftWidth += gap + childDivs[j - 1].offsetWidth;
        }
        childDivs[j].style.left = leftWidth + "px";
    }
}

window.onload = setAlign(&#039;row&#039;, &#039;box&#039;);
window.onresize = function () {
    setAlign(&#039;row&#039;, &#039;box&#039;);
}
```

<p><a href="http://codepen.io/Mr_Green/pen/CBGIz" title="Working fiddle" target="_blank">Working fiddle</a></p>

<p data-height="268" data-theme-id="1592" data-slug-hash="CBGIz" data-default-tab="result" data-user="Mr_Green" class='codepen'>See the Pen <a href='http://codepen.io/Mr_Green/pen/CBGIz/'>fixed gap among the elements in a container</a> by venkateshwar (<a href='http://codepen.io/Mr_Green'>@Mr_Green</a>) on <a href='http://codepen.io'>CodePen</a>.</p>
<script async src="//assets.codepen.io/assets/embed/ei.js"></script>
