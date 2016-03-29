---
layout: post
title: Main plugins required in a UI Project
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

I am just noting down here the plugins/libraries which I think are the most required ones while developing any UI project.

- Module loader (_[Webpack](https://webpack.github.io/) handles better_)
- Validations
	- Field validations
	- Title validations (_To show all field errors at one place_)
	- Global validations (_To show success or error messages from server_)
- API Library (_A small library_)
	- Server API
	- Local API (_`.json` files, when server api calls are not ready_)
- Maintaining states (_now a days, [Redux](https://github.com/reactjs/redux) handles this better, AFAIK_)
- Date library (_I prefer creating our own as per when requirements shows up_)
- Dropdown library (_with all necessary events_)
	- Editable dropdown
	- Suggesting dropdown
	- Normal dropdown
- Promises (_for calling functions after completion of asynchronous calls, [blue bird](https://github.com/petkaantonov/bluebird) handles this better_)
- Task runner (_I prefer [gulp](http://gulpjs.com/)_)
- Template engine (_There are many, I prefer [marko](https://github.com/marko-js/marko)_)
- Images lazy loading (_[layzr.js](http://callmecavs.com/layzr.js/)_)
