---
layout: post
title: Make elements center align to each other using only css
date: 2015-05-22 10:39:18.000000000 +05:30
categories:
- technical
tags:
- align
- center
- css
- elements
- stretch
status: publish
type: post
published: true
author:     "Venkateshwar"
header-img: "img/home-bg.jpg"
---
<h2 id="for-limited-known-items"><strong><em>For limited known items:</em></strong></h2>
<p>Suppose, we know the number of items present in a container. Lets say the items to be <code>4</code>. Lets wrap those items in separate sections each and give those sections <code>float: left</code> and <code>width: 25%</code>. Here I am giving <code>width: 25%</code> because there are four sections which need to cover the container completely i.e <code>100/4 = 25%</code>. This will result in something similar view as shown below in the image:</p>
<p><img src="assets/pv2Yi.png" alt="enter image description here" title="" /></p>
<p>As you can see in the above image, the items are still not aligned to each other. We can see gap between the last item and the container. But if you ignore the gap, you can see that the items are equally aligned to each other.</p>
<p><img src="assets/SUBGw.png" alt="enter image description here" title="" /></p>
<p>So now we should just be able to remove the width of the section holding the last item. This can be done using <code>:last-child</code> selection. Since, the last item holder is now hidden, we need to stretch other child holders. Hence, we need to divide <code>100%</code> by <code>3</code> instead of <code>4</code>. </p>
<pre><code>.child-holder{
    width: 33.3%;   /* Instead of 25% */
}

.child-holder:last-child {
    width: 0px;
}
</code></pre>
<p>It stretches the items but this hides the last item. As you can see in the below image:</p>
<p><img src="assets/1allT.png" alt="enter image description here" title="" /></p>
<p>We can solve this by giving negative <code>margin-left</code> to each item with value equal to the items. Applying so, will now hides the first item. So, give <code>margin-left</code> to the container equal to the itemâ€™s width (<em>positive value</em>).</p>
<pre><code>.parent {
    margin-left: 20px;  /* This value is equal to the item's width */
}
.child {
    width: 20px;
    height: 20px;
    background-color: black;
    margin-left: -20px;  /* negative margin equal to its width */
}
</code></pre>
<p>Hence, this will give the solution we want:</p>
<p><img src="assets/oz2rO.png" alt="enter image description here" title="" /></p>
<p><a href="http://jsfiddle.net/venkateshwar/ywdfLxd7/2/"><strong>Working Fiddle</strong></a></p>
<h2 id="for-unknown-number-of-items"><strong><em>For unknown number of items</em></strong>:</h2>
<p>For unknown number of items, we will replace <code>float: left</code> to the item holding sections with <code>display: table-cell</code> and to stretch those sections, we will apply <code>display: table; width: 100%;</code> to the parent container. and since we must apply <code>margin-left</code> value equal to the itemâ€™s width, we will have a parent wrapper, to which we apply <code>margin-left</code> instead. (<em>Because, if we apply margin-left and width: 100% to same element, then the element will overflow</em>)</p>
<p>Though we are giving <code>width: 0px</code> to the last item holder section, it is still occupying the space. </p>
<p><img src="assets/pv2Yi.png" alt="enter image description here" title="" /></p>
<p>This can be solved by applying <code>table-layout: fixed</code> to the parent container. This will give us the solution:</p>
<p><img src="assets/oz2rO.png" alt="enter image description here" title="" /></p>
<p><a href="http://jsfiddle.net/venkateshwar/ywdfLxd7/3/"><strong>Working Fiddle</strong></a></p>
<p>This solution will work for any number of items, added dynamically or static. It will get automatically adjusted.</p>
<h2 id="for-unknown-number-of-items-with-unequal-widths"><em>For Unknown number of items with unequal widths</em>:</h2>
<p>For unequal/unknown width of items, we should definitely go with javascript. Here is the small code which I wrote to use in one of the projects:</p>
<pre><code>function setAlign(parentClass, childCommonClass) {
    var childDivs = document.getElementsByClassName(childCommonClass);
    var childDivsTotalWidth = 0;
    var childDivsLength = childDivs.length;
    var parentElement = document.getElementsByClassName(parentClass)[0];
    var parentElementWidth = parentElement.offsetWidth;
    for (var i = 0; i &lt; childDivsLength; i++) {
        childDivsTotalWidth += childDivs[i].offsetWidth;
    }
    var remainingWidth = parentElementWidth - childDivsTotalWidth;

    var gap = remainingWidth / (childDivsLength - 1);
    var leftWidth = 0;
    for (var j = 0; j &lt; childDivsLength; j++) {
        if (j &gt; 0) {
            leftWidth += gap + childDivs[j - 1].offsetWidth;
        }
        childDivs[j].style.left = leftWidth + "px";
    }
}

window.onload = setAlign('row', 'box');
window.onresize = function () {
    setAlign('row', 'box');
}
</code></pre>
<p><a href="http://codepen.io/Mr_Green/pen/CBGIz"><strong>Working Fiddle</strong></a></p>
