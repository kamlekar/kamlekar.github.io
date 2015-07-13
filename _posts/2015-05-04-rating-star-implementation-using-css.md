---
layout: post
title: Rating star implementation using CSS
date: 2015-05-04 03:40:04.000000000 +05:30
categories: []
tags: []
status: publish
type: post
published: true
author:     "Venkateshwar"
header-img: "img/home-bg.jpg"
---
<h2>HTML</h2>
<pre>
    &lt;input id=&quot;star_1&quot; value=&quot;1&quot; type=&quot;radio&quot; checked name=&quot;star&quot;&gt;&lt;/input&gt;
    &lt;label for=&quot;star_1&quot;&gt;&amp;#9733&lt;/label&gt;
    &lt;input id=&quot;star_2&quot; value=&quot;2&quot; type=&quot;radio&quot; name=&quot;star&quot;&gt;&lt;/input&gt;
    &lt;label for=&quot;star_2&quot;&gt;&amp;#9733&lt;/label&gt;
    &lt;input id=&quot;star_3&quot; value=&quot;3&quot; type=&quot;radio&quot; name=&quot;star&quot;&gt;&lt;/input&gt;
    &lt;label for=&quot;star_3&quot;&gt;&amp;#9733&lt;/label&gt;
    &lt;input id=&quot;star_4&quot; value=&quot;4&quot; type=&quot;radio&quot; name=&quot;star&quot;&gt;&lt;/input&gt;
    &lt;label for=&quot;star_4&quot;&gt;&amp;#9733&lt;/label&gt;
    &lt;input id=&quot;star_5&quot; value=&quot;5&quot; type=&quot;radio&quot; name=&quot;star&quot;&gt;&lt;/input&gt;
    &lt;label for=&quot;star_5&quot;&gt;&amp;#9733&lt;/label&gt;
</pre>
<h2>CSS</h2>
<pre>
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
</pre>
<p><a title="JSFIDDLE" href="http://jsfiddle.net/venkateshwar/65hf0h9y/4/" target="_blank">JSFIDDLE</a></p>
