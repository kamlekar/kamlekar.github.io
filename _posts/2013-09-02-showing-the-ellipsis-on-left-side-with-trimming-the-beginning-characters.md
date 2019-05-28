---
layout: post
title: Showing the ellipsis on left side with trimming the beginning characters
date: 2013-09-02 03:26:36.000000000 +05:30
categories:
- technical
tags:
- after
- before
- css
- ellipsis
- left side
- pseudo element
- pseudo element selector
- trim beginning letters
status: publish
type: post
published: true
author:     "Venkateshwar"
header-img: assets/img/home-bg.jpg"
---
<p>Today, I am going to explain how to show ellipsis on right side of the text and also trimming the beginning part of the text instead of the ending part.<br />
We know that using <code>text-overflow: ellipsis</code> will show ellipsis on the right side of the text by trimming the ending part of the text which is the default behaviour. The CSS used for this default ellipsis is:</p>
<pre>   text-overflow: ellipsis;
   overflow: hidden;
   white-space: nowrap;</pre>
<p>There is no straight way to show ellipsis on right side. So, we will use <code>:before</code> pseudo element selector and create our own ellipsis, which is three dots. Something like this:</p>
<pre>    content: "...";</pre>
<p>Hence, we will not use <code>text-overflow: ellipsis</code> anywhere.<br />
The content text is visible at right side instead of left (which we want to have). To make it to left, assign <code>position: absolute</code> to the "before pseudo element" and also <code>left: 0</code> to bring the text to left. To make this changes related to the parent element (which is original element that holds the text) assign <code>position: relative</code> to the parent element.<br />
Now we got the created ellipsis on left but it is merging the beginning characters of the element. To solve this, give the same background-color, which has the parent element, to the "before pseudo element" . Hurray!! We got the ellipsis!!. but hey wait, the ellipsis is also visible to the text which is smaller than the width of the parent element.<br />
To solve this, we will also use <code>:after</code> pseudo selector element. Here comes the tricky part. To this "after pseudo element" we will assign the content css property with a value of text whose length is approximately equal to the width of the parent element.</p>
<pre>content: "............................................................"</pre>
<p>This "after pseudo element" content should always be above the "before pseudo element" content. So, assign <code>position: relative</code> and <code>z-index: 2</code> to the "after pseudo element" and <code>z-index: 1</code> to the "before pseudo element".<br />
Sigh.. this is solved but there are some drawbacks which are listed below:</p>
<ul>
<li>The trimming of beginning letters is not perfect.</li>
<li>Not for the elements whose maximum width is unknown.</li>
<li>Working fine on IE9+, Chrome and firefox.</li>
</ul>
<p>Here is the code:<br />
HTML:</p>
<pre>&lt;span class="ellipsis"&gt;C:\Program Files\Java\jre7\bin\new_plugin\npdeployjava1.dll&lt;/span&gt;</pre>
<p>CSS:</p>
<pre>    .ellipsis:after {
        content:"..........................";
        background-color: white;
        color: transparent;
        position: relative;
        z-index: 2;
    }
    .ellipsis {
        direction: rtl;
        display: inline-block;
        width: 200px;
        white-space: nowrap;
        overflow: hidden;
        position: relative;
        border: 1px solid black;
        z-index: 3;
    }
    .ellipsis:before {
        content:"...";
        background-color: white;
        position: absolute;
        left: 0;
        z-index: 1;
    }</pre>
