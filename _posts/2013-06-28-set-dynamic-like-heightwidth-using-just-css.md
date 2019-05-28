---
layout: post
title: Set dynamic like height/width using just css
date: 2013-06-28 08:14:38.000000000 +05:30
categories:
- technical
tags:
- css
- dynamic
- height
- like
- pure css
- width
status: publish
type: post
published: true
author:     "Venkateshwar"
header-img: assets/img/home-bg.jpg"
---
<div dir="ltr" style="text-align:left;">Many web developers need a design like having two div elements adjacent to each other and occupying the complete width of the parent element. Something like this:</p>
<div class="separator" style="clear:both;text-align:center;"><a style="margin-left:1em;margin-right:1em;" href="http://2.bp.blogspot.com/-aHMciKMmcJk/UcbBNKSj-SI/AAAAAAAAAB0/BoesFupZtEI/s1600/Untitled.png"><img alt="" src="assets/4ed5c-untitled.png" width="400" height="126" border="0" /></a></div>
<p>In the above shown image, we are considering a parent element which has a fluid layout i.e the width is in percentages and it is responsive whenever the user shrinks/expands the browser window.</p>
<p>This clearly states that we can't give the width to the child elements in pixels (i.e fixed length) because if we do so then the layout will be no longer responsive and results in bad design.</p>
<p>Let just say that there is a need where we need to have one child div of fixed width and other of responsive. (the other child element is responsive to keep the complete layout responsive).</p>
<p>Many developers in their career beginning stage thinks that this is not possible using just css. because the height of the second child element must be changed whenever the browser shrinks/expands. Though it would have been easy if both the child elements were in percentages.</p>
<p>In conditions like this I have seen my colleagues were using javascript to change the width of the second child element dynamically. (well even I used to do the same)</p>
<p>The fact is that this type of problem can be solved using just css. By using some magic properties like:</p>
<p><span style="background-color:#666666;"><br />
</span></p>
<div style="text-align:left;"><span style="background-color:#eeeeee;"><span style="font-family:'Courier New', Courier, monospace;">float, position, margin and overflow.</span></span></div>
<p><span style="font-size:small;"><i><br />
</i></span><br />
<span style="font-size:small;"><i>I call the above properties as "magic properties" because they can do miracles (I think so) which can lead to good or worst(if not used correctly) results.</i></span></p>
<p><b>Solution</b>:</p>
<p>The above problem can be solved by applying positioning to the elements. In this solution, we will not mention any width to the second child element. Instead, we will apply <span style="background-color:#eeeeee;">position: absolute<span style="background-color:white;"> to it</span></span>. This will move the second child element out of the parent element box. This happens because a element with absolute positioning does layout with respect to the parent element or ancestor element which has positioning applied.  if it can't find any parent element with positioning then it will do layout with respect to <span style="background-color:#eeeeee;">body</span> element. So, to keep the second child element inside the parent element we will assign <span style="background-color:#eeeeee;">position: relative;</span>  to the parent element. Now as we know the first child element is of fixed width let just say it as <span style="background-color:#eeeeee;">width: x px</span>. we can assign <span style="background-color:#eeeeee;">left </span>and <span style="background-color:#eeeeee;">right</span> css properties to the second child element based on the fixed width of the first child element and also <span style="background-color:#eeeeee;">top</span> css property to pin the second child element to the parent element. So, the complete css would be something like this:</p>
<pre>.parentDiv {
    position: relative;    /* wrap the positioned child elements inside it */
    height: 200px;
}
.firstChildDiv {
    width : 100px;
    height : 100px;
}
.secondChildDiv {
    position: absolute;
    top: 0px;      /* pin to top of the parent element */
    left : 100px;  /* based on the fixed width of the first child element */
    right: 0px;
    height : 100%;
}</pre>
<p>Here is the <a href="http://jsfiddle.net/venkateshwar/nkBpB/1/" target="_blank">Working Fiddle</a>.</p>
<p>This can also be solved using <span style="background-color:#eeeeee;">float: left</span> and <span style="background-color:#eeeeee;">margin-left</span> instead of positioning. I never tried that though.</p>
</div>
