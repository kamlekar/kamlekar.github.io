---
layout: post
title: Radial progress bar
date: 2015-06-29 12:17:19.000000000 +05:30
categories: 
- technical
tags:
- posts 
- css
- radial
- percentage
- pie
- chart
status: publish
type: post
published: true
author: Venkateshwar
header-img: "img/home-bg.jpg"
---
<p>Recently, I created a radial progress bar with help from <a href="http://stackoverflow.com/users/2606013/harry">Harry</a>. I am sharing the code here. In future, if I get time, I will explain it.</p>
<h2 id="html">HTML</h2>

```javascript
<div class="radial-container">
    <div class="radial"></div>
    <div class="container">
        <div class="left"></div>
        <div class="right"></div>
        <div class="bottom-left"></div>
        <div class="bottom-right"></div>
    </div>
</div>
```

<h2 id="css">CSS</h2>

```css
.container {
    position: absolute;
    left: 0;
    right: 0;
    top: 0;
    bottom: 0;
}
.left, .right, .bottom-left, .bottom-right {
    position: absolute;
    top: 0;
    bottom: 0;
    width: 50%;
    background-color: white;
}
.right {
    left: 50%;
}
.left {
    z-index: 2;
}
.right {
    z-index: 0;
}
.bottom-left, .bottom-right {
    width: 100%;
    left: 0;
    border-radius: 50%;
    z-index: -1;
    transform: rotate(0deg);
}
.bottom-left {
    background: linear-gradient(90deg, tomato 50%, transparent 50%);
    transition: transform 0s linear;
}
.bottom-right {
    background: linear-gradient(90deg, transparent 50%, tomato 50%);
    transition: transform 0s 0s linear, z-index 0s 0s linear;
}
.radial:hover + .container .animate.bottom-left {
    z-index: 1;
    transition: transform 1s linear;
}
.radial:hover + .container .animate.bottom-right {
    z-index: 3;
    transition: transform 1s 1s linear, z-index 0s 1s linear;
}
.radial {
    border-radius: 50%;
    border: 10px solid transparent;
    background-color: skyblue;
    cursor: pointer;
    top: 10px;
    left: 10px;
    right: 10px;
    bottom: 10px;
    position: absolute;
    z-index: 5;
}
.radial-container {
    width: 100px;
    height: 100px;
    position: relative;
}
```

<h2 id="jquery">jQuery</h2>

```javascript
function progress(value, elem) {
    function transform(v) {
        return {
            'transform': 'rotate(' + v + 'deg)'
        }
    }
    if (!value || value &gt; 100) value = 0;
    var enter = 'mouseenter',
        leave = 'mouseleave',
        $el = $(elem),
        $radial = $(elem).find('.radial'),
        $bLeft = $(elem).find('.bottom-left'),
        $bRight = $(elem).find('.bottom-right'),
        className = 'animate';
    $radial.off(enter).on(enter, function () {
        var deg = (360 * value / 100);
        if (deg &lt;= 180) {
            $bLeft.css(transform(deg)).addClass(className);
            $bRight.removeClass(className);
        } else {
            $bLeft.css(transform(180)).addClass(className);
            $bRight.css(transform((deg - 180))).addClass(className);
        }
    }).off(leave).on(leave, function () {
        $bLeft.css(transform(0)).removeClass(className);
        $bRight.css(transform(0)).removeClass(className);
    });

}
// Mention the percentage here
// As an example, I mentioned the percentage as 40
progress(40, '.radial-container');
```
<p><strong><a href="http://jsfiddle.net/venkateshwar/wmytz6x3/14/">Working Fiddle</a></strong></p>

<p data-height="268" data-theme-id="1592" data-slug-hash="GJGKvy" data-default-tab="result" data-user="Mr_Green" class='codepen'>See the Pen <a href='http://codepen.io/Mr_Green/pen/GJGKvy/'>GJGKvy</a> by venkateshwar (<a href='http://codepen.io/Mr_Green'>@Mr_Green</a>) on <a href='http://codepen.io'>CodePen</a>.</p>
<script async src="//assets.codepen.io/assets/embed/ei.js"></script>
