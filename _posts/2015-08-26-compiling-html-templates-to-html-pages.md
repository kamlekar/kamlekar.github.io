---
layout: post
title: Compiling HTML templates to HTML pages
subtitle:   ""
date: 2015-08-26 07:59:44.000000000 +05:30
categories:
- technical
tags:
- posts
- compile
- precompile
- template
- engine
- html
- gulp
- gulp-nunjucks-render
- nunjucks
status: publish
type: post
published: true
author: Venkateshwar
header-img: "img/home-bg.jpg"
---

### Explanation:
Whenever I used to search on google for "pre-compiling templates", I was ending up on sites which were combining all the HTML template files to one single js file. But in my case, I was looking for a way to compile the templates completely on system itself with no support of a "all template compiled js file". (_So, I was looking for a solution which pre-pre-compiles the HTMLs_)

### Solution:
I found this awesome template engine, [Nunjucks][1], which lets me compile the HTML templates to Independent HTML pages when used with gulp. 

Check this one, [gulp-nunjucks-render](https://github.com/carlosl/gulp-nunjucks-render). By using this along with gulp, I am able to include section of `.html` files into other `.html` files. Here is the code (_assuming you installed nodejs and gulp_):

```javascript
var gulp = require('gulp');
var nunjucksRender = require('gulp-nunjucks-render');

gulp.task('default', function () {
	nunjucksRender.nunjucks.configure(['templates/'], { watch: false });
	return gulp.src('templates/!(_)*.html')
		.pipe(nunjucksRender({
			css_path: "../assets/css/",
			js_path: "../assets/js/",
			img_path: "../assets/images/"
		}))
		.pipe(gulp.dest('html'));
});
gulp.task('watch', function () {
		gulp.watch(['templates/*.html'], ['default']);
});
```

In the above code, I am keeping the HTML templates in `templates` folder and with the above gulp code, I am generating the new HTMLs in `html` folder. The above code will not generate the files which are prefixed with `_`. (_something similar to sass_)

and later in command prompt:

```css
gulp watch  // Watches the files for changes continuously --> OWNING :D
```

Here is an example:

```css
<!-- // Index.html -->
<!-- SITE BUG: Please replace <percentage> with % -->
<!DOCTYPE html>
<html>
	{<percentage> include _head.html <percentage>}
	<body>
		{<percentage> include _content.html <percentage>}
		{<percentage> include _footer.html <percentage>}
	</body>
</html>
```

Which renders to:

```css
<!DOCTYPE html>
<html>
	<head>
		<title>Website title</title>
		<link rel="Stylesheet" href="../assets/jcss/main.css" type="text/css"/>
	</head>
	<body>
		<div class="page">
			<!-- content here -->
		</div>
		<div class="footer">
				<!-- footer content here -->
		</div>
	</body>
</html>
```

### Advantages:
- No need of server support to compile the templates.
- No need to include any js file in index.html.
- Whenever we do some change in common section, no need to include that section again in every page.

### Disadvantages:
- Till now, I didn't find any :).

Based on this, I wrote a simple [HTML Skinning Boilerplate](https://github.com/kamlekar/HTML-Skinning-Boilerplate).

  [1]: http://mozilla.github.io/nunjucks/
