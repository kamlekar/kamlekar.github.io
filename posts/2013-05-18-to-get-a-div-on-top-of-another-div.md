---
layout: post
title: To get a div on top of another div. Even though the div is below the other
  div.
date: 2013-05-18 01:13:22.000000000 +05:30
categories:
- technical
tags:
- posts
- another
- css
- div
- top
status: published
type: post
published: true
author: Venkateshwar
header-img: "img/home-bg.jpg"
---
<p>This can be solved easily if the divs have fixed height, say 20px.  Then you can do the following trick:</p>

```javascript
<div>
    <div style="width:200px;background:#F00;height:20px;margin-top:20px;"></div>
    <div style="width:200px; background:#CCC;height:20px;margin-top:-40px;"></div>
</div>
```
<p>What I did here is that added the margin-top to the below div in negative value. Not to mention that you must be good in calculations.</p>
<p>You can also use translateX and translateY CSS3 properties when the height is fixed and known.</p>
<p>What if the height is unknown?</p>
<p>If the heights of the div elements are not fixed or unknown, then it can be solved using javascript. (No way using pure CSS).</p>
<p>Here is the code:</p>

```javascript
<script>
window.onload = function(){
  changePosition();
}
function changePosition(){
  var childOne = document.getElementById('childOne');
  var childTwo = document.getElementById('childTwo');
  // Getting the height of the elements
  var heightOne = childOne.offsetHeight;
  var heightTwo = childTwo.offsetHeight;
  // Giving marginTop to the first div equal to the height of the second div
  childOne.style.marginTop = heightTwo;
  // Giving the combination height of the two div's in negative
  // to the second div.
  childTwo.style.marginTop = -(heightOne + heightTwo);
}
</script>
```

<p>I hope this atleast gives you an idea about what to do when you have more than two div's :)</p>
