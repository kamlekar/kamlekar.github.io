---
layout: post
title: Load script files dynamically using JavaScript and then call a callback function.
date: 2015-06-17 08:17:35.000000000 +05:30
categories:
- Articles
- example
- javascript
- tutorials
- web
tags:
- dynamic
- dynamically
- javascript
- js
- load
- script
- sequence
status: publish
type: post
published: true
author:     "Venkateshwar"
header-img: "img/home-bg.jpg"
---
<p>Here is the code which I am using to load files dynamically. You just need to pass the values in arrays such that all dependency files are loaded.</p>
<pre>

    function loadFiles(files, fn) {
        if (!files.length) {
            files = [];
        }
        var head = document.head || document.getElementsByTagName(&#039;head&#039;)[0];

        function loadFile(index) {
            if (files.length &gt; index) {
                var fileref = document.createElement(&#039;script&#039;);
                fileref.setAttribute("type", "text/javascript");
                fileref.setAttribute("src", files[index]);
                head.appendChild(fileref);
                index = index + 1;
                // Used to call a callback function
                fileref.onload = function () {
                    loadFile(index);
                }
            } else if(fn){
                fn();
            }
        }
        loadFile(0);
    }

</pre>
<p>Here are more <a href="http://stackoverflow.com/a/29250976/1577396">similar solutions</a> which hadn't worked in my case.</p>
