---
layout: post
title: Usage of SVG stroke dasharray
subtitle: ""
date: 2017-11-27 07:59:44.000000000 +05:30
categories:
- technical
tags:
- css
- svg
- circle
- pie
- pie chart
- chart
- stroke
- dasharray
status: publish
type: post
mathML: true
published: false
author: "Venkateshwar"
header-img: assets/img/home-bg.jpg"
---


<p>I am still new to SVG and its quite exciting whenever I come to know more about it. Recently, I did an experiment with <code>stroke-dasharray</code> an SVG presentational attribute. It amazed me when I came to know how tricky and mysterious it can be. </p>

<p>Let me explain my requirement where I need a multi color donut chart, as shown in the below image:</p>

<p><img src="https://upload.wikimedia.org/wikipedia/commons/3/3c/Vega-piechart.png" alt="Hollow Pie chart representation" title=""></p>

<p></p><figcaption>Source: <a href="https://commons.wikimedia.org/wiki/File:Vega-piechart.png">https://commons.wikimedia.org/wiki/File:Vega-piechart.png</a></figcaption><p></p>

<p>From <a href="https://www.smashingmagazine.com/2015/07/designing-simple-pie-charts-with-css/">Lea’s article</a>, I came to know how to create a basic donut chart using SVG’s <code>stroke-dasharray</code>. So I decided to create a multi-coloured donut chart without using any library.  I just need to build my own component based on Lea’s idea. To summarize lea’s article, it all comes down to coloring the required potion of circle's circumference with specified color</p>



<h4 id="circumference-formula-implies-2pi-r"><script type="math/tex" id="MathJax-Element-1">Circumference formula</script>  <script type="math/tex" id="MathJax-Element-2">\implies</script> <script type="math/tex" id="MathJax-Element-3">2\pi r</script></h4>



<h4 id="60-of-circumference-implies-2pi-r-frac60100"><script type="math/tex" id="MathJax-Element-4">60\%</script> <script type="math/tex" id="MathJax-Element-5">of</script> <script type="math/tex" id="MathJax-Element-6">Circumference</script>  <script type="math/tex" id="MathJax-Element-7">\implies</script>  <script type="math/tex" id="MathJax-Element-8">2\pi r</script> <script type="math/tex" id="MathJax-Element-9">*</script> <script type="math/tex" id="MathJax-Element-10">\frac{60}{100}</script></h4>

<p>So, in <code>stroke-dasharray</code>, we will have two values, first will be the circumference in required percentage and the next will be the circumference itself. i.e</p>



<h4 id="stroke-dasharray-2pi-r-frac601002pi-r"><strong>stroke-dasharray:</strong>  <script type="math/tex" id="MathJax-Element-11">(2\pi r</script> <script type="math/tex" id="MathJax-Element-12">*</script> <script type="math/tex" id="MathJax-Element-13">\frac{60}{100}),</script><script type="math/tex" id="MathJax-Element-14">(2\pi r)</script></h4>

<p>Now, if I have the following <code>circle</code>:</p>

<pre><code>&lt;svg&gt;
    &lt;circle cx="50" cy="50" r="50"&gt;&lt;/circle&gt;
&lt;/svg&gt;
</code></pre>

<p>As the radius for circle is <code>50</code> and assumed applied percentage is <script type="math/tex" id="MathJax-Element-32">60\%</script>, the <code>stroke-dasharray</code> would look like:</p>



<h4 id="stroke-dasharray-2-pi-50-frac60100-2-pi-50"><strong>stroke-dasharray:</strong>   <script type="math/tex" id="MathJax-Element-15">(2 * \pi * 50</script> <script type="math/tex" id="MathJax-Element-16">*</script> <script type="math/tex" id="MathJax-Element-17">\frac{60}{100}),</script> <script type="math/tex" id="MathJax-Element-18">(2 * \pi * 50)</script></h4>

<p>As <code>stroke-dasharray</code> is a presentational attribute, we can apply the above using css:</p>

<pre><code>circle {
    stroke-dasharray: calc(2 * 22 / 7 * 50), calc(2 * 22 / 7 * 50 * 60 / 100);
    stroke-width: 10;
}
</code></pre>

<p>The circumference formula in above calculation needn’t to be executed on runtime. So, I will switch over to SCSS to precompile the calculation and make the code more readable (<em>this step is not redundant but still who doesn’t love SCSS ? </em>). </p>

<pre><code>circle {
    $pi: 22/7;
    $radius: 50;
    $circumference: 2 * $pi * radius;
    stroke-dasharray: calc(#{$circumference} * 60 / 100), #{$circumference};
    stroke-width: 10;
}
</code></pre>

<p>Again since the percentage value is dynamic, it is better to handle the <code>stroke-dasharray</code> value using JavaScript (<em>even the circumference calculations</em>).  But if you are fine with <a href="https://developer.mozilla.org/en-US/docs/Web/CSS/Using_CSS_variables">CSS Custom Variables</a> then you can do as follows: </p>

<pre><code>:root {
    --percent: 0;  // default value
}

circle {
    $pi: 22 / 7;
    $radius: 50;
    $circumference: 2 * $pi * radius;
    stroke-dasharray: calc(#{$circumference} * var(--percent), #{$circumference};
    stroke-width: 10;
}
</code></pre>

<p>The above explanation just covers the fundamentals to create a single pie in donut chart. Now to create another pie inside the donut chart, we need to create another circle inside SVG.</p>

<pre><code>&lt;svg&gt;
    &lt;circle class="pie-one" cx="50" cy="50" r="50"&gt;&lt;/circle&gt;
    &lt;circle class="pie-two" cx="50" cy="50" r="50"&gt;&lt;/circle&gt;
&lt;/svg&gt;
</code></pre>

<p>If we say the first pie holds <script type="math/tex" id="MathJax-Element-19">60\%</script> and the second <script type="math/tex" id="MathJax-Element-20">20\%</script>, then second pie would start from on top of the first pie's stroke when it is rendered because the circle positions are same, hence the stroke color will be overlapping one on another. To make the second pie visible, we need to rotate it by <script type="math/tex" id="MathJax-Element-21">60\%</script>  (i.e first pie’s percentage).  i.e</p>



<h4 id="60-implies-frac60100-360circ-implies-216circ"><script type="math/tex" id="MathJax-Element-22">60\%</script> <script type="math/tex" id="MathJax-Element-23">\implies</script> <script type="math/tex" id="MathJax-Element-24">\frac{60}{100}</script> <script type="math/tex" id="MathJax-Element-25">*</script> <script type="math/tex" id="MathJax-Element-26">360^\circ</script>  <script type="math/tex" id="MathJax-Element-27">\implies</script>  <script type="math/tex" id="MathJax-Element-28">216^\circ</script></h4>

<p>Well if there is another pie, we need to rotate it by <code>first pie's percentage + second pie's percentage</code>. Since all pie diagrams start with a <script type="math/tex" id="MathJax-Element-29">90^\circ</script> off, it is better to rotate all these <code>circles</code> by <script type="math/tex" id="MathJax-Element-30">-90^\circ</script> or <script type="math/tex" id="2">270^\circ</script> maybe through a parent element i.e a <code>group</code> tag.</p>

<pre><code>&lt;svg&gt;
    &lt;g class="circles"&gt;
        &lt;circle class="pie-one" cx="50" cy="50" r="50"&gt;&lt;/circle&gt;
        &lt;circle class="pie-two" cx="50" cy="50" r="50"&gt;&lt;/circle&gt;
        &lt;circle class="pie-three" cx="50" cy="50" r="50"&gt;&lt;/circle&gt;
    &lt;/g&gt;
&lt;/svg&gt;

.circles {
    transform: rotate(-90deg);
}
</code></pre>

<p>As in the real scenario, the circles could be dynamic, it is better to generate the circles through JavaScript and pass the percentage values through an object. I got my donut chart by following the above steps, hope it will be helpful to you as well.</p>

<p data-height="300" data-theme-id="1592" data-slug-hash="ZabqPM" data-default-tab="js,result" data-user="Mr_Green" data-embed-version="2" data-pen-title="Hollow pie chart" class="codepen">See the Pen <a href="https://codepen.io/Mr_Green/pen/ZabqPM/">Hollow pie chart</a> by venkateshwar (<a href="https://codepen.io/Mr_Green">@Mr_Green</a>) on <a href="https://codepen.io">CodePen</a>.</p>
<script async src="https://production-assets.codepen.io/assets/embed/ei.js"></script>



<hr>
