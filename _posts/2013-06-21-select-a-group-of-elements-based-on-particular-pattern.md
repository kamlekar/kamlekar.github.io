---
layout: post
title: Select a group of elements based on particular pattern
date: 2013-06-21 10:59:59.000000000 +05:30
categories:
- example
tags:
- posts
- jquery regex
- jquery regex selector
- select elements based on particular pattern
- select elements based on regex
status: publish
type: post
published: true
author: Venkateshwar
header-img: "img/home-bg.jpg"
---
<p>Using jQuery, one can fetch particular patterned elements easily.  I mean if someone is in need to select some elements (say, div elements) which have class names similar like classOne, classTwo, classThree etc.,</p>
<p>All the classes which I mentioned above have in common "class". So, many users think that it might be possible to do regex on those elements and get the required result. But how?</p>
<p>It is possible using "<a href="http://api.jquery.com/filter/" target="_blank">filter()</a>" method of jQuery. You can do something like this:</p>

```css
$('div').filter(function () {
    return /PassYourRegexHere/.test(this.className);
}).css('background-color', 'silver'); //do your stuff here
```

<p>The <code>filter()</code> filters the div elements based on the regex expression.</p>
<p>The regex according to the above example would be <code>/(^|s)class/</code>.</p>
<p>Well, this is easy. isn't it?</p>
<p>You can play the same on other incidents like when you want to filter some elements who have a variable which holds some particular number or something else. You know what to do when you have power of regex to filter some elements :D.</p>
<p>Anyway, I am not sure whether this is recommended by developers. My suggestion is this type of approach is ok and also when I done some jsperf tests on it, I found that regex is faster than string manipulations(or same). you can find the jsperf test <a href="http://jsperf.com/regexstrmanipulation/6" target="_blank"><strong>here</strong></a>.</p>
<p>Here are the similar links on Stackoverflow which I had answered recently. <a href="http://stackoverflow.com/a/17141092/1577396" target="_blank">link1</a> and <a href="http://stackoverflow.com/a/17229527/1577396" target="_blank">link2</a></p>
