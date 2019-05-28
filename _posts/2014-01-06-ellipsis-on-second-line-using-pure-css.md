---
layout: post
title: Ellipsis on second line using pure css
date: 2014-01-06 10:17:57.000000000 +05:30
categories:
- technical
tags:
- css
- ellipsis
- line
- second
status: publish
type: post
published: true
author:     "Venkateshwar"
header-img: assets/img/home-bg.jpg"
---
<p>Guys while working to get ellipsis on second line in my project, I realized we can do this using just CSS!! </p>
<p><strong>PROS:</strong><br />
The solution supports IE9+ and ofcourse all modern browsers.</p>
<p><strong>CONS:</strong><br />
- Looks misplaced for long words.</p>
<pre>
&lt;div class="ellipsis"&gt;
    &lt;span&gt;...&lt;/span&gt;
    Hello this is Mr_Green from Stackoverflow. I love CSS. I live in CSS and I will never leave working on CSS even my work is on other technologies.
&lt;/div&gt;
</pre>
<pre>
div {
    height: 3em;
    line-height: 1.5em;
    width: 80%;
    border: 1px solid green;
    overflow: hidden;
    position: relative;
}
div:after {
    content:". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  . . . . . . . . . . . . . . . . . . . . . . . . . . . .";
    background-color: white;
    color: white;
    display: inline;
    position: relative;
    box-shadow: 8px 1px 1px white;
    z-index: 1;
}
span {
    position: absolute;
    bottom: 0px;
    right: 0px;
    background-color: white;
}
</pre>
<p><strong>Explanation: </strong> </p>
<p>Below are the points to remember: </p>
<ul>
<li>
If you want the ellipsis on second line then make sure that the height you have given is the multiple of <code>line-height</code> and number <code>2</code>(<i>second line</i>, the number will be <code>3</code> to get the ellipsis on third line.)
</li>
<li>
Look how I <code>z-indexed</code> the span's three dots and the <code>after</code> pseudo element's dots. which plays the main role in getting this ellipsis like structure.
</li>
<li>
Make sure the dots in <code>content</code> property fits the container if there is no text.
</li>
<li>
Make sure the <code>background-color</code> and <code>color</code> css properties of the pseudo element of content has the same color as the background color of the content element.
</li>
<li>The space between each dot <code>(.)</code> makes sure that the ellipsis will be seen when the content is overflown out of the container or if the content is very near to get overflown (drawback).
</li>
<li>Also make sure the box-shadow color of the pseudo element is similar to the background color of the content element.
</li>
</ul>
<p><strong>NOTE: </strong><span>If you use <code>word-break: break-all;</code> on the content element then there will be no drawbacks except the words will break. if it is ok for your project then this solution is perfect. </span></p>
<p>I hope you understood my explanation. If not then please feel free to leave a comment below. Happy coding :) </p>
