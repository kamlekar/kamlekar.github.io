---
layout: post
title: ! 'Are you sure you need "overflow: hidden" here?'
date: 2014-10-03 08:51:38.000000000 +05:30
categories: 
- technical
tags: []
status: draft
type: post
published: false
author:     "Venkateshwar"
header-img: "img/home-bg.jpg"
---
<p><strong>Disclaimer</strong>: In this post, I am just sharing my experience. If I am wrong in any context then please comment to this post so that I can learn or correct myself.</p>
<p>While doing layout in HTML, there are many magic fixes which make our work easy. According to me, one of those magic fixes is using <code>overflow: hidden</code> CSS property. This property should be used if and only if you want to hide some content or elements inside a container but this property can also be used to <strong>clear float of child elements</strong> which I highly discourage to do so.</p>
<p>Let me explain first the ways to clear float of child elements. In normal layouts, if we increase the height of the child container(s), then the parent container stretches its height accordingly to contain/cover its child elements. This doesn't happen when a child container is a floating element or absolute/fixed positioned element (<em>I am not talking about positioned elements in this post</em>).</p>
<p>Consider an example where a container has three child containers. These three child containers are made floating elements by using <code>float: left</code> CSS property. These floating elements couldn't be contained inside the parent container when their heights are increased until the float is cleared. The float can be cleared by using <code>clear</code> CSS property or applying <code>overflow: hidden</code> property to the parent container.</p>
<ol>
<li><strong>Using Clear CSS property</strong>: To use the <code>clear</code> property, we should add a new child element inside the parent container. This child element is used to clear to floating of other child elements. This dummy child element should be at last in parent container. This dummy child elements should be applied with <code>clear: both;</code>.</li>
<li><strong>Using Overflow CSS property</strong>: To clear the floating of child elements, the parent should be applied with <code>overflow: hidden</code> or <code>overflow: auto</code></li>
</ol>
<p>If we check the above two methods, the latter one looks easy to implement because it has just one line to add in css when compare to the former where we need to add a last child element and clear float class to it.</p>
