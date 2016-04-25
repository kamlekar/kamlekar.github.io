---
layout: post
title: Plugins required in a UI Project
subtitle:   ""
date: 2016-03-29 07:59:44.000000000 +05:30
categories:
- technical
tags:
- framework
- plugin
- library
- js
- javascript
status: publish
type: post
published: true
author:     "Venkateshwar"
header-img: "img/home-bg.jpg"
---

Recently, I read this [article](http://www.catonmat.net/blog/frameworks-dont-make-sense/) which stated that Frameworks are huge anti-pattern in Software Development. Most of the cases for any project, we don't require frameworks, we just require some functionalities from those frameworks. 

I agreed with the author and thought to note down the libraries/plugins which I think require most while developing any UI project, considering not depending on any Framework. Here are those things:

- Module loader (_Like [Webpack](https://webpack.github.io/)_)
- Routing library
- SVG Spritesheet (_Inline SVG concept_)
- Validations
	- Field validations
	- Title validations (_To show all field errors at one place_)
	- Global validations (_To show success or error messages from server_)
- API Library (_A custom library_)
	- Server API
	- Local API (_`.json` files, when server api calls are not ready_)
- Maintaining states (_Like [Redux](https://github.com/reactjs/redux)_)
- Date library (_I prefer creating our own as per when requirements shows up_)
- Dropdown library, because default dropdown sucks (_with all necessary events_)
	- Editable dropdown
	- Suggesting dropdown
	- Normal dropdown
- Promises (_for calling functions after completion of asynchronous calls, like [Bluebird](https://github.com/petkaantonov/bluebird)_)
- Task runner (_like [gulp](http://gulpjs.com/)_)
- Template engine (_There are many, like [nunjucks](https://mozilla.github.io/nunjucks/) or [marko](https://github.com/marko-js/marko)_)
- Images lazy loading (_[layzr.js](http://callmecavs.com/layzr.js/) and [lazysizes](https://github.com/aFarkas/lazysizes)_). You can also consider image preloading which doesn't require any library.
