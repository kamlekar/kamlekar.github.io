---
layout: post
title: Async loading of templates
subtitle: ""
date: 2016-06-10 07:59:44.000000000 +05:30
categories:
- technical
tags:
- requirejs
- template
- hierarchical
- amd
- async
status: publish
type: post
published: true
author: "Venkateshwar"
header-img: "img/home-bg.jpg"
---

If you are using Async module loader, it becomes pretty easy to manage all the templates which need to be loaded dynamically when required. Using textjs plugin along with requirejs I was loading template files when needed. But additional to this, I had a requirement, where there was a possibility that a template could have dependency on other template(s) and those template(s) can have dependency on other template(s). The hierarchical chaining could go as much deep as possible based on requirement. For example, let us say that we need to load a `form` template. The `form` template has fields like `textbox`, `button`, `textarea`, `select` etc. For consistency, I made these fields as components and placed them in separate template files like `textbox.html`, `button.html` etc. And since, each field can have different custom attributes, I created another template file which holds attributes for each template, in `attributes.html`.

Here is an example using Lodash templates:

### textbox.html

    <label class="lbl <%= data.labelClass %> > <%= data.label %> </label>
    <input type="text" class="field-txt <%= data.fieldClass %>" <%= sb.setTemplate('attributes', data.attributes) %> ></input>

### attributes.html

    <% for(var key in data.attributes) { %>
        <%= key %>= <%= data.attributes[key] %>
    <% } %>


And here is the code, which I used to manage and load these templates dynamically, using requireJS:

<script src="https://gist.github.com/kamlekar/7895c3c1b6ba0b778c27d42ee2b4445a.js"></script>
