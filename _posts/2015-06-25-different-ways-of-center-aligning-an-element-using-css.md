---
layout: post
title: Different ways of center aligning an element using css
date: 2015-06-25 10:50:15.000000000 +05:30
categories:
- Articles
- css
- example
tags:
- align
- center
- child
- container
- css
- element
- horizontal
- vertical
status: publish
type: post
published: true
author:     "Venkateshwar"
header-img: "img/home-bg.jpg"
---
<p>To explain different ways of center aligning an element, I will consider a parent element in which I will center align a child element.</p>
<h2 id="the-known-old-way">The known old way:</h2>
<p>We know this that to center an element in a container, we should move the child element vertically from top to a value which is the subtraction of the half of the height of the container and the half of the height of the child element itself. Like:</p>
<pre><code>containerHeight/2   -    childHeight/2
</code></pre>
<p>Similarly, we should move the child element horizontally from left to a value which is subtraction of the half of the width of the container and the half of the width of the child element itself. Like:</p>
<pre><code>containerWidth/2   -    childWidth/2
</code></pre>
<h2 id="fixed-dimensions-parent-element-and-child-element">Fixed dimensions parent element and child element:</h2>
<p>The above method can be done in css, using the following code:</p>
<pre><code> // Assuming dimensions of the container are 300 X 300
 // Assuming dimensions of the child are 50 X 50
 .child {
     width: 50px;
     height: 50px;
     margin-top: 125px;
     margin-left: 125px;
 }
</code></pre>
<p>A fiddle to show the same. <a href="http://jsfiddle.net/4nckcu2m/">Fiddle</a></p>
<h2 id="fluid-dimensions-parent-element-and-fixed-dimensions-child-element">Fluid dimensions parent element and fixed dimensions child element:</h2>
<p>The above method works fine when you are aware of the parent element’s dimensions. but what if you don’t know the dimensions of the parent element?</p>
<p>There is a css trick. We need to apply <code>top</code> and <code>left</code> css properties to the child element with a value of <code>50%</code>, which acts as half of the dimensions of the parent element and then applying <code>margin-left</code> and <code>margin-top</code> properties in negative equal to the half of the dimensions of the child element. Something like this:</p>
<pre><code>  .parent {
       width: 300px;
       height: 300px;
       position: relative;
  }
  .child {
       width: 50px;
       height: 50px;
       position: absolute;
       top: 50%;
       left: 50%;
       margin-top: -25px;  /* half of the height of this child element */
       margin-left: -25px; /* half of the width of this child element */
  }
</code></pre>
<p>A fiddle to show the same. <a href="http://jsfiddle.net/4nckcu2m/1/">Fiddle</a></p>
<p>Here we are using four crucial css properties which are center aligning the child element i.e <code>top</code>, <code>left</code>, <code>margin-top</code> and <code>margin-left</code>. But in css3, there is no need of all these four properties. We can using <a href="https://developer.mozilla.org/en-US/docs/Web/CSS/calc"><code>calc()</code></a> property and do something like this:</p>
<pre><code>  .child {
      /* other css properties */
      top: calc(50% - 25px);
      left: calc(50% - 25px);
  }
</code></pre>
<h2 id="fluid-parent-element-and-fluid-child-element">Fluid parent element and fluid child element:</h2>
<p>Now, the above one works great if we know dimensions of the child element. But what if we don’t know the dimensions of the child element as well as the parent element? Lets say there dimensions change based on the viewport.</p>
<p>In this case, we can use css3’s <a href="https://developer.mozilla.org/en-US/docs/Web/CSS/transform#Browser_compatibility"><code>transform translate</code></a> property and modify the above code as follows:</p>
<pre><code> .child {
     /* other css properties */
     top: 50%;
     left: 50%;
     transform: translate(-50%, -50%); /* Instead of margin-left and margin-top properties */
 }
</code></pre>
<p>The above works fine but produces a scrollbar in IE9+. To avoid that, we need to consider from bottom and right instead of top and left. As shown below:</p>
<pre><code> .child {
      /* other css properties */
      bottom: 50%;
      right: 50%;
      transform: translate(50%, 50%);
 }
</code></pre>
<p>Note that I am giving translate value in positive because we are considering bottom and right instead of top and left.</p>
<p>So, here is the <a href="http://jsfiddle.net/4nckcu2m/2/">Modified fiddle</a>.</p>
<p>Now this works great in fluid containers with unknown/dynamically changing dimensions., lets checkout some other tricks by using which we can have the same effect.</p>
<h2 id="using-display-flex">Using display flex</h2>
<p>This will work for fluid parent element as well as for fluid child element.</p>
<pre><code>.parent {
    width: 300px;
    height: 300px;
    background-color: tomato;
    display: flex;
    align-items: center;
    justify-content: center;
}
.child {
    width: 50px;
    height: 50px;
    background-color: beige;
}
</code></pre>
<p>Here is the <a href="http://jsfiddle.net/venkateshwar/4nckcu2m/6/">Fiddle</a></p>
<h2 id="using-table-cell-and-vertical-align-middle">Using table-cell and vertical-align middle</h2>
<p>For this to work, the parent element should have a fixed height mentioned in units other than percentage. The child can have a fluid dimensions layout.</p>
<pre><code>.parent {
    width: 300px;
    height: 300px;
    background-color: tomato;
    display: table-cell;
    vertical-align: middle;  /* to align the child element vertically */
}
.child {
    width: 50px;
    height: 50px;
    background-color: beige;
    margin: 0 auto;  /* to align horizontally */
}
</code></pre>
<p>Here is the <a href="http://jsfiddle.net/4nckcu2m/4/">Fiddle</a></p>
<h2 id="using-pseudo-selector-and-vertical-align-middle">Using pseudo selector and vertical-align middle</h2>
<p>This works for fluid parent element as well as child element. </p>
<pre><code>.parent {
    width: 300px;
    height: 300px;
    background-color: tomato;
    text-align: center;
}
.parent::after {
    content:"";
    width: 0px;
    height: 100%;
    display: inline-block;
    vertical-align: middle;
}
.child {
    width: 50px;
    height: 50px;
    background-color: beige;
    display: inline-block;
    vertical-align: middle;
}
</code></pre>
<p>Here is the <a href="http://jsfiddle.net/4nckcu2m/3/">Fiddle</a></p>
<p>I hope my explanation is clear. Let me know if I miss something. </p>
<p>Happy coding!! :)</p>
