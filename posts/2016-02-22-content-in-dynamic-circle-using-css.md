---
layout: post
title: Content in Dynamic circle using CSS
subtitle:   ""
date: 2016-02-22 07:59:44.000000000 +05:30
categories:
- technical
tags:
- css
- circle
- dynamic
- increase
- decrease
- pure css
status: publish
type: post
published: true
author:     "Venkateshwar"
header-img: "img/home-bg.jpg"
---

**Requirement**:

A circle element has some content in it. The content is being added dynamically. Based on the content's size, the circle should increase or decrease.

**Explanation**:

For this, we need to consider following things:

- width of the circle element should increase or decrease based on the content.
- height should be equal to width of the circle element. (to form a circle)

The formal point happens by default in css. We just need to give `display: inline-block` or `float: left` to the circle element. But what about the latter point?  this doesn't happen by default in CSS. 

There is known trick in CSS to create a responsize square container. We will apply the following css properties:

    .square {
        width: 0px;
        height: 0px;
        padding-top: 100%;
        padding-right: 100%;
        /* for visualization */
        /* background-color: tomato; */
    }

The above code will create an horizontally responsive square. Here the `padding-top` and `padding-right` are relative to the parent container's `width` (_Yes, `padding-top` is not relative to parent's `height` but relative to `width`_).

Now, lets add a dummy container inside our circle element. This dummy element will stretch the parent container i.e circle element in to a square by having the styles which we mentioned above.

    <div class="circle">
        <div class="dummy-element square"></div>
    </div>

Lets assume the `.circle` element has basic css properties like:

    .circle {
        border-radius: 50%;
        float: left;
        border: 1px solid black;
        font-size: 15px;
    }

Now lets add content to our circle element inside a wrapper. 

    <div class="circle">
        <div class="dummy-element square"></div>
        <div class="content">Some content here</div>
    </div>

If we see in result, we can see an oval shaped container instead of circle which we want. This is happening because the content inside `.content` is occupying height which in turn stretching the parent container (i.e circle element). So, lets remove the height to the content.

    .content {
        height: 0px;
    }

Now, we can see a perfect circle in result but the content is at the bottom of the circle but not in middle of the circle. As far as I know, we can't bring the content in the middle of the circle as we are doing currently. We actually need two identical contents, one invisible content to stretch the parent container's width and other to be in middle of the parent container. So, this can be done using `::after` and `::before` pseudo elements and their property `content` with `attr()` function.

So, what we will do is, instead of holding the content inside the `.content` container, we will pass the content as a custom attribute (_say, `data-label`_). and then by using the following code we can have two identical contents.

Here is the HTML:

    <div class="circle">
        <div class="dummy-element square"></div>
        <div class="content" data-label="Some content here"></div>
    </div>

Here is the CSS:

     .content::after, .content::before {
         content: attr(data-label);
     }

As you can see, the width of the circle element is double because the content inside it is twice. So, lets make an pseudo element as float element, by applying `position: absolute`. And also to this pseudo element we need to bring it in middle of the circle element by applying following properties:

    .content::after {
        position: absolute;
        /* code to bring it in middle */
        bottom: 50%;
        right: 50%;
        transform: translate(50%, 50%);
        /* To make content in center */
        text-align: center;
    }

Now the `content` element will come in middle to the `body` element instead of the `circle` element. So, lets make it relative to the `circle` element by applying `position: relative` to the `circle` element.

    .circle {
        /* code to make the content positioned relative to this element */
        position: relative;
        /* old code */
        border-radius: 50%;
        float: left;
        border: 1px solid black;
        font-size: 15px;
    }

As you can see the result, the content has came in middle of the circle element. But the similar content is also present at the bottom. We are using this content to stretch the parent container. So, definitely we need this. We don't require this content as per our requirement, so lets hide it by applying `visibility: hidden` or `color: transparent` or `opacity: 0`.

    .content::before {
        color: transparent;
    }

Thats it!! 

Now change the content to see how the element is maintaining the Circle aspect.

Here is the completed codepen:

<p data-height="268" data-theme-id="1592" data-slug-hash="BjgYPQ" data-default-tab="result" data-user="Mr_Green" class='codepen'>See the Pen <a href='http://codepen.io/Mr_Green/pen/BjgYPQ/'>BjgYPQ</a> by venkateshwar (<a href='http://codepen.io/Mr_Green'>@Mr_Green</a>) on <a href='http://codepen.io'>CodePen</a>.</p>
<script async src="//assets.codepen.io/assets/embed/ei.js"></script>

Happy Coding!! :)
