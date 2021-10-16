---
layout: post
title: Table tbody scroll (cross-browser)
date: 2013-06-17 05:28:39.000000000 +05:30
categories:
- technical
tags:
- posts
- cross-browser
- css
- html
- html table
- ie8
- scroll
- table
- tbody
status: publish
type: post
published: true
author: Venkateshwar
header-img: "img/home-bg.jpg"
---
<p>There are many blogs based on tbody scroll of table but none (AFAIK) are cross-browser compatible. So, I thought to post one which works fine in IE8+, Chrome and Firefox. Let me know if there are any issues through below comments.</p>
<p>HTML</p>

```css
<table>
    <thead>
        <tr>
            <th>head</th>
            <th>head</th>
            <th>head</th>
            <th>head</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>row</td>
            <td>row</td>
            <td>row</td>
            <td>row</td>
        </tr>
        <tr>
            <td>row</td>
            <td>row</td>
            <td>row</td>
            <td>row</td>
        </tr>
        <tr>
            <td>row</td>
            <td>row</td>
            <td>row</td>
            <td>row</td>
        </tr>
        <tr>
            <td>row</td>
            <td>row</td>
            <td>row</td>
            <td>row</td>
        </tr>
        <tr>
            <td>row</td>
            <td>row</td>
            <td>row</td>
            <td>row</td>
        </tr>
        <tr>
            <td>row</td>
            <td>row</td>
            <td>row</td>
            <td>row</td>
        </tr>
        <tr>
            <td>row</td>
            <td>row</td>
            <td>row</td>
            <td>row</td>
        </tr>
        <tr>
            <td>row</td>
            <td>row</td>
            <td>row</td>
            <td>row</td>
        </tr>
    </tbody>
</table>
```

<p>CSS</p>

```css
table {
    border-collapse: collapse;
    width: 100%;
}
thead {
    text-align:left;
    display: table;
    float: left;
    width: 100%;
}
thead tr {
    display: table-row;
    width: 100%;
}
tbody {
    display: block;
    height: 120px;
    overflow: auto;
    float: left;
    width: 100%;
}
tbody tr {
    display: table;
    width: 100%;
}
tbody tr {
    height: 18px;
}
tbody td {
    padding:1px 8px;
}
th, td {
    width: 25%;
}

tr:after{   /* IE8 fix */
    content: ".";
    margin-left: -3px; /* to hide the content above tr */ /* not necessary if you are ok with 1px gap */
    visibility: hidden;
}
```

<p>You can also check the post on <a title="StackOverflow" href="http://stackoverflow.com/q/16984323/1577396" target="_blank">StackOverflow</a> which I had asked and answered it after figuring it out. Here is the <a title="Working Fiddle" href="http://jsfiddle.net/venkateshwar/X8FSw/18/" target="_blank">Working Fiddle</a> and <a title="demo" href="http://jsfiddle.net/venkateshwar/X8FSw/18/show/" target="_blank">demo</a> to check in IE8.</p>
