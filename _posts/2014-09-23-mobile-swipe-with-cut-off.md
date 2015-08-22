---
layout: post
title: Mobile Swipe with cut-off
date: 2014-09-23 06:26:50.000000000 +05:30
categories:
- technical
tags:
- javascript
- jquery
- jquery-mobile
- swipe
status: publish
type: post
published: true
author:     "Venkateshwar"
header-img: "img/home-bg.jpg"
---
<p>Recently, I created a component to swipe a container which will reveal a hidden container. For this purpose, I used <code>jQuery 1.11.0</code> and <code>jQuery-mobile-1.4.4</code>. I mentioned the detailed process under the code. Here is the code:</p>
<pre>
$(document).ready(function () {
    // Global object
    var swipe = {};
    // Cut-off value  (Change value as per your need)
    swipe.value = 120;
    // Vicinity or range in which swipe should work (Change value as per your need)
    swipe.vicinity = 30;
    // container  (Change value to your element)
    var w = $("#page");
    // swiping container  (Change value to your element)
    var m = $("#m");
    // Mousedown event
    w.on("vmousedown", function (e) {
        // Get the x-axis value of the cursor pointer
        swipe.point = e.pageX;
        // Check whether the swiping container is not far than the provided vicinity
        // This is just to make sure that the swiping container is at the very beginning of the parent container.
        var left = m[0].offsetLeft &lt; swipe.vicinity;
        // A boolean variable to check whether the pointer is in left vicinity
        var LeftVicinity = ((swipe.point &lt; swipe.vicinity) &amp;&amp; left);
        var x = swipe.value * 2;
        var y = swipe.vicinity * 2;
        // A boolean variable to check whether the pointer is in right vicinity
        var rightVicinity = ((swipe.point &gt; (x - y)) &amp;&amp; (swipe.point &lt;= (x + y)) &amp;&amp; !left)
        // swipe.mousedown is a boolean which will be true if the user has pressed mousedown button to swipe in the above provided vicinity.
        swipe.mousedown = LeftVicinity || rightVicinity;
    });
    // Mouseup event
    $(document).on(&quot;vmouseup&quot;, function (e) {
        // Check if the swipe should be invoked
        if (swipe.mousedown) {
            // If the swipe container has more distance than the cut-off value
            // then left swipe animation should occur
            if (swipe.point &amp;&amp; swipe.point &lt; swipe.value) {
                m.animate({
                    left: &quot;0px&quot;
                });
            }
            // If the swipe container has less distance than the cut-off value
            // then right swipe animation should occur
            else {
                m.animate({
                    left: swipe.value * 2 + &quot;px&quot;
                });
            }
            swipe.mousedown = false;
        }
    });
    w.on(&quot;vmousemove&quot;, function (e) {
        // checks whether to invoke swipe and also whether it is in swipe vicinity.
        if (swipe.mousedown &amp;&amp; e.pageX &lt;= swipe.value * 2) {
            swipe.point = e.pageX;
            m.css({
                left: swipe.point + &quot;px&quot;
            });
        }
    });

});
</pre>
<p><strong><a href="http://jsfiddle.net/venkateshwar/vw51kk82/10/">Working Fiddle</a></strong></p>
