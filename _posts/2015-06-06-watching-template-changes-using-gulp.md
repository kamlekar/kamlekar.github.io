---
layout: post
title: Watching template changes using Gulp
date: 2015-06-06 14:03:43.000000000 +05:30
categories:
- technical
tags:
- gulp
- gulpfile.js
- javascript
- pre-compiler
- template
status: publish
type: post
published: true
author:     "Venkateshwar"
header-img: "img/home-bg.jpg"
---
<p>This article explains how to watch changes in templates using gulp while developing. </p>
<h3 id="introduction">Introduction</h3>
<p>Gulp is a task runner which let us to concentrate on Development instead of working on other tasks such as <a href="https://github.com/jkphl/gulp-svg-sprite">creating svg spritesheet</a>, uglifying js or watching for changes in template files or css pre-processor files like Sass or less. (<em>and many other things</em>)</p>
<h3 id="scenario">Scenario</h3>
<p>Lets say I have many templates which actually I am keeping in the <code>index.html</code> file, of the project, inside the <code>script</code> tag. Something like this:</p>
<pre><code>
    &lt;!-- Home page html markup --&gt;
    &lt;div&gt;Hello &lt;/div&gt;



    &lt;!-- About page html markup --&gt;

</code></pre>
<p>and then I am using a template rendering script to render the htmls inside the above mentioned script tags. For example, using lodash templates.</p>
<pre><code>var homeHtml = document.getElementById('home-page').innerHTML;
document.body.innerHTML = homeHTML({username: "xyz"});
</code></pre>
<p>Coming to the point, though the above approach works very well but it will look clustered when there are many templates. This will definitely become a mess and not understandable.</p>
<p>So, to organize the code, lets separate templates and html markup (i.e <code>index.html</code>) in to different files. and also keep each template in a separate file i.e <code>.html</code> file. But wouldn't it be expensive to call these template html files on request through ajax?</p>
<p>Well, it depends, whether we are fetching the html template files individually or as a group. There are actually many ways to handle templates. I will give highlight of the ways I know:</p>
<ul>
<li>Server side templating : In this case, the server has all the html template files. The server language will render the templates for you as per the request sent and then it sends out the response to the client as HTTP or ajax request. </li>
<li>Server - client templating :  In this case, the server will send the html file and also the JSON object to the client side. Later, the client side will stitch those html and JSON object and renders to one, on the page. </li>
<li>Client side templating : In this case, the client side will already have all the template files. It just need the information to render in those template files and render on to the page. The server language just sends the JSON object as information to the client side. Later the client side will apply the JSON object information to the already available template file.</li>
</ul>
<h3 id="approach">Approach</h3>
<p>To be clear, in this article, I am talking about the latter way which is "client side templating".  So, what I am going to do is keep each template content in a <code>.html</code> file inside a directory named <code>app/templates</code>.</p>
<pre><code>templates
    --&gt; Dashboard
       --&gt; left-content.html
       --&gt; right-content.html
    --&gt; About
       --&gt; development.html
    --&gt; profile
       --&gt; basic-profile.html
       --&gt; advanced-profile.html
</code></pre>
<p>and then I will use gulp to pre-compile the above html templates to a single javascript file in an object as shown below:</p>
<pre><code>var templates = {
    left-content: "html markup here",
    right-content: "html markup here",
    graph-section: "html markup here",
    basic-profile: "html markup here",
    advanced-profile: "html markup here"
}
</code></pre>
<h3 id="solution">Solution</h3>
<p>Before moving further, lets list out the steps which we actually need to follow to pre-compile html templates to a one single object.</p>
<ul>
<li>Fetch all the <code>.html</code> files from the <code>app/templates</code> folder</li>
<li>Run a loop to each file to get  the <code>filename</code> (<em>without extension</em>) and the content in it. We can use these file names as key and their content as value inside the compiling object.</li>
</ul>
<p>To achieve the above steps, I am using gulp plugins <code>fs</code>, <code>gulp-tap</code>, <code>path</code> and <code>stringify-object</code>. These plugins should be installed in the local working project directory which can be done using <code>--save-dev</code> flag in command prompt. If you are unfamiliar with gulp or its plugins installation, please visit <a href="http://gulpjs.com/">gulpjs.com</a></p>
<p>Moving forward, here is the code in <code>gulpfile.js</code> which can be used to compile all the html templates to one js object and store it in a js file.</p>
<pre><code>var gulp = require('gulp');
var fs = require('fs');
var tap = require('gulp-tap');
var path = require('path');
var stringify = require('stringify-object');


// Defining a task
gulp.task('template-build', function () {
    // The object which will be added to the compiled js file
    var templates = {};

    gulp.src('app/templates/*/*.html')
    // Run a loop through all files in 'app/templates/*/*.html'
    .pipe(tap(function (file, t) {
        // For each file in the loop get file name from file path
        var filePath = file.relative;
        var fileNameWithExt = path.basename(filePath);
        var fileName = fileNameWithExt.substring(0, fileNameWithExt.lastIndexOf("."));
        templates[fileName] = fs.readFileSync('app/templates/' + filePath, 'utf8');
    }))
        .pipe(tap(function () {
        fs.writeFile('app/common/templates.js', "var templates =  " + stringify(templates).replace(/[\n\r]*/g, ""));
    }));
});

// this runs the `bundle-templates` task before starting the watch (initial bundle)
gulp.task('watch', ['template-build'], function () {
    // now watch the templates and the js file and rebundle on change
    gulp.watch(['app/templates/*/*.html'], ['template-build']);
});
</code></pre>
<p>And then in command prompt:</p>
<pre><code>cd
gulp watch
</code></pre>
<p>This command line will watch for changes in those html template files. Whenever there is a changes in any template file, the pre-compiler runs automatically and updates the object in the compiled js file.</p>
<h3 id="notes">Notes</h3>
<ul>
<li>This gulp watch will not work when you add new template file while the watch is in running state. Though there is a way to cover this issue, which I haven't shown here.</li>
<li>The compiling of object can be improved further by compressing/uglifying the code. As you can see, I am not compressing the html files. I am just formatting the html files to a single line and appending in to the compiling object.</li>
<li>This approach has a drawback of not able to have javascript one line comments inside the templates i.e using <code>//</code>.</li>
</ul>
<p>Please share your thoughts by posting comments below :)</p>
<p>Thanks!!</p>
