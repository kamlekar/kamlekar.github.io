---
layout: post
title: Rating star implementation using CSS
date: 2015-05-04 03:40:04.000000000 +05:30
categories: 
- technical
tags:
- posts 
- ratings
- star
- css
- radio
- buttons
status: publish
type: post
published: true
author: Venkateshwar
header-img: "img/home-bg.jpg"
---
<h2>HTML</h2>

```css
<input id="star_1" value="1" type="radio" checked name="star"></input>
<label for="star_1">&amp;#9733</label>
<input id="star_2" value="2" type="radio" name="star"></input>
<label for="star_2">&amp;#9733</label>
<input id="star_3" value="3" type="radio" name="star"></input>
<label for="star_3">&amp;#9733</label>
<input id="star_4" value="4" type="radio" name="star"></input>
<label for="star_4">&amp;#9733</label>
<input id="star_5" value="5" type="radio" name="star"></input>
<label for="star_5">&amp;#9733</label>
```

<h2>CSS</h2>

```css
input[type="radio"] {
    visibility: hidden;
    pointer-events: none;
    position: absolute;
}
label {
    position: relative;
    margin-right: 30px;
    display: inline-block;
    margin-top: 30px;
    transform: rotate(0deg);
    transition: transform 1s, background 1s;
    color: gold;
    font-size: 40px;
    width: 50px;
    height: 50px;
    text-align: center;
    line-height: 50px;
    border-radius: 50%;
    background-color: #ACACAC;
    border: 4px solid silver;
    cursor: pointer;
}
:checked + label {
    color: gold;
    transform: rotate(-144deg);
    background-color: #ACACAC;
}
:checked + label ~ label {
    background-color: beige;
    transform: rotate(-144deg);
    color: tomato;
}
```

<p><a title="JSFIDDLE" href="http://jsfiddle.net/venkateshwar/65hf0h9y/4/" target="_blank">JSFIDDLE</a></p>
