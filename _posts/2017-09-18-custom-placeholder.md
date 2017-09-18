---
layout: post
title: Custom placeholder Styling and Animation
subtitle: ""
date: 2017-09-18 07:59:44.000000000 +05:30
categories:
- technical
tags:
- javascript
- css
- html
- custom
- label
- placeholder
status: publish
type: post
published: true
author: "Venkateshwar"
header-img: "img/home-bg.jpg"
---


## Requirement:
Suppose that there is a requirement such that when I click on a text field, its placeholder will move from inside that field to on top of it, becoming its label instead of the placeholder. This is a common requirement nowadays as this comes under the hood of User Experience.

## Concept:
The common way is to wrap the input field inside a label, in HTML. This kind of HTML structure will actually associate with the parent label with the child input field. That means whenever you click on the label, the input field inside will get active. This kind of structure is not useful until another element inside the label is added like a `DIV` or `SPAN`. See the example below:

    <label>
        <input type="text"></input>
        <span>Hello</hello>
    <label>

Now, from the above HTML example, even if we click on the `SPAN` with `hello` text in it, the input field will get active because the click will propagate to its parent element `LABEL` which is associated with input field.

> Note: This kind of approach is also useful to create custom checkboxes, radio buttons, dropdown (`SELECT`), datepicker etc..

## Approach:

So as per above requirement, we need a label which acts as placeholder and when the input is active, it should act as a label. For that, lets place a `SPAN` element after `INPUT` field. This `SPAN` element will be positioned inside the `INPUT` field and style it to look as a placeholder and when the `INPUT` field is active, the positioning from the `SPAN` is removed and placed it above the `INPUT` field. Also, we should consider that when the `INPUT` field is not active and it has some value in it, the `SPAN` element should still be a label instead of placeholder.  

## Solution 1 (_Using JavaScript_):


<p data-height="307" data-theme-id="1592" data-slug-hash="zEYadL" data-default-tab="js,result" data-user="Mr_Green" data-embed-version="2" data-pen-title="zEYadL" class="codepen">See the Pen <a href="https://codepen.io/Mr_Green/pen/zEYadL/">zEYadL</a> by venkateshwar (<a href="https://codepen.io/Mr_Green">@Mr_Green</a>) on <a href="https://codepen.io">CodePen</a>.</p>
<script async src="https://production-assets.codepen.io/assets/embed/ei.js"></script>


## Solution 2 (_Using only CSS_)

The same solution can be achieved using just CSS by using [`:placeholder-shown`](https://developer.mozilla.org/en-US/docs/Web/CSS/:placeholder-shown) pseudo selector. This pseudo selector is only supported in Modern browsers at the time of this writing. 

Since, in CSS, we can style related to preceding adjacent selectors, lets place the `SPAN` after the `INPUT` element and then reverse their positioning by using flexbox and `flex-direction: column-reverse`. Here is the code:

<p data-height="300" data-theme-id="1592" data-slug-hash="NaGVRm" data-default-tab="css,result" data-user="Mr_Green" data-embed-version="2" data-pen-title="NaGVRm" class="codepen">See the Pen <a href="https://codepen.io/Mr_Green/pen/NaGVRm/">NaGVRm</a> by venkateshwar (<a href="https://codepen.io/Mr_Green">@Mr_Green</a>) on <a href="https://codepen.io">CodePen</a>.</p>
<script async src="https://production-assets.codepen.io/assets/embed/ei.js"></script>


