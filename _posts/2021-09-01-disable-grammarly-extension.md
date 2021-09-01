---
layout: post
title: Disable grammarly extension
subtitle: ""
date: 2021-09-01 11:59:44.000000000 +05:30
categories:
- technical
tags:
- grammarly
- extension
- disable
- chrome
- firefox
status: published
type: post
published: true
author: "Venkateshwar"
header-img: "img/home-bg.jpg"
---

 It's tricky to disable Grammarly extension. There are many outdated posts on internet which suggest to disable this extension by their provided HTML attribute like 
-   `data-gramm="false"`
-   `data-gramm_editor="false"`
-   `data-enable-grammarly="false"`

These attributes keep changing and I am not sure what is the latest working attribute. So, I solved this using CSS. Basically, I found grammarly is adding `grammarly-extension` custom web component as sibling to the text inputs i.e input, textarea and contenteditable elements. Also, it adds `grammarly-desktop-integration` and `grammarly-popups` custom web components as sibling elements to `body` root element - This is for underline to the text errors and popups with suggestions.

Seeing this I added the following code in CSS, which worked:

```
grammarly-extension,
grammarly-desktop-integration, 
grammarly-popups {
    display: none;
}
```

But sometimes, we don't want to disable this extension to all text inputs in the page or all the pages in a project. In that case, it is better to add the above CSS when that specific component editor is active or hovered on and remove the CSS when that editor is inactive.

Also, if we just want to remove the bottom-right grammarly icon in text input but not the grammarly suggestions for errors, it is possible to specifically disable in this case with below code:

```
.disable-grammarly grammarly-extension {
    display: none;
}
```
The above code require our custom class `disable-grammarly` to the wrapper of the text input.  If the class is supposed to be for text input then the above selector will change to `.disable-grammarly ~ grammarly-extension`
