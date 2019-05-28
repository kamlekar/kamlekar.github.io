---
layout: post
title: Small underline on hover
date: 2013-09-02 03:28:59.000000000 +05:30
categories:
- technical
tags:
- after pseudo element
- after pseudo elementafter pseudo elementafter pseudo selectorafter pseudo selectorunderlineunderlinesmallsmallmiddlemiddleon
  hoveron hoverhoverhover
- after pseudo selector
- hover
- middle
- on hover
- small
- underline
status: publish
type: post
published: true
author:     "Venkateshwar"
header-img: assets/img/home-bg.jpg"
---
<div>Sometimes there will be a need to show a small underline on hover of a element. Well this can be achieved using just css.</div>
<div></div>
<div>As we know that there is a pseudo element selector :after,  we will use this to the hover state of the element.</div>
<div></div>
<div>Something like this:  <code> .element:hover:after</code></div>
<div></div>
<div>Now lets talk about how it can be achieved:</div>
<div>To achieve this, we will make the original element as parent element and the :after pseudo element to the hover state of the original element as child element.</div>
<div></div>
<pre>    span              ---&gt;   Parent element
    span:hover:after  ---&gt;   Child element</pre>
<div></div>
<div>Now we know that, by using positioning to the above elements, we can keep them relative to each other.</div>
<div></div>
<pre>    Parent element --&gt; position: relative;
    Child element  --&gt; position: absolute;</pre>
<div></div>
<div>By assigning the above css properties,  we can stretch the child element as much we can using left and right css properties. (which works with only positioning applied elements). Hence, we no need to take care of the width of the parent element.</div>
<div>Applying height to the child element will act as thickness of the underline.</div>
<div>Now, just assign some value to the left and right css properties. Assigning in percentages would be better when we are dealing with unknown widths of the elements.</div>
<div></div>
<div>Here is the code:</div>
<div></div>
<div>HTML:</div>
<div></div>
<pre>    &lt;span&gt;some sentence with small underline in middle&lt;/span&gt;</pre>
<div>CSS:</div>
<div></div>
<pre>            .underline{
                position: relative;
            }
            .underline:hover:after{
                content: "";
                position: absolute;
                left: 10%;
                right: 10%;
                bottom: -1px;
                height: 2px;
                background-color: cornflowerblue;
            }</pre>
