---
layout: post
title: Pinning items in a list while scrolling
subtitle:   ""
date: 2016-04-05 07:59:44.000000000 +05:30
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

I had a requirement in a project where there are two adjacent containers. The left container has list of items and the right container, shows up left container's selected item details, dynamically through ajax.

This has simple functionality of showing up selected item details in the right container through ajax. I did implemented it. But the problem was when I scroll down the left container (which is holding the items), the selected item was hiding up (_going out of fold_) and hence the context was lost of which item's details are being shown up in the right container.

To fix this, the Interaction designers came up with brilliant idea of pinning up the selected item when the user is scrolling the left container. So, if the user is scrolling the container and the selected item is hiding in bottom, then the selected item will be pinned to bottom vice versa.

So, the cases I should consider are:

- When user scrolling down and if the selected item is hidden in down fold, then the selected item should pin to down of the left container.
- When user scrolling up and if the selected item is hidden in up fold, then the selected item should pin to up of the left container.
- When the user is scrolling and the selected item is visible in the fold, then nothing should happen.

I created a sample code using jQuery, but it had some issues. So, I asked a question on [Stackoverflow](http://stackoverflow.com/q/31448349/1577396). Where I got a perfect answer. 

Here is the code:

    function stickItems($parent, itemClass, selectClass) {
        // Attach dummy element items
        $parent.prepend('<div class="' + itemClass + ' sticky top"></div>');
        $parent.append('<div class="' + itemClass + ' sticky bottom"></div>');

        var $items = $('.' + itemClass),
            $stickyTop = $('.' + itemClass + '.sticky.top'),
            $stickyBottom = $('.' + itemClass + '.sticky.bottom');

        // Click event registering 
        $items.click(function (e) {
            if (!$(e.target).hasClass('sticky')) {
                $items.removeClass(selectClass);
                $stickyTop.css('display', 'none');
                $stickyBottom.css('display', 'none');
                $(this).addClass(selectClass);
            }
        });



        // Scroll event
        $parent.scroll(function () {
            var $self = $(this);
            var $selected = $('.' + itemClass + '.' + selectClass);
            var cTop = $selected.offset().top;
            var pTop = $self.offset().top;
            var cHeight = $selected.height();
            var pHeight = $self.height();
            if (cTop - pTop <= 0) {
                $stickyTop.html($selected.html()).css({
                    'display': 'block',
                        'top': $(this).scrollTop()
                });
                $stickyBottom.css('display', 'none');
            } else if (cTop > pTop && cTop < pTop + pHeight) {
                $stickyTop.css('display', 'none');
                $stickyBottom.css('display', 'none');
            } else {
                $stickyTop.css('display', 'none');
                $stickyBottom.html($selected.html()).css({
                    'display': 'block',
                        'bottom': -$(this).scrollTop()
                });
            }
        });
    }

    stickItems($('.parent'), 'item', 'select');

Happy coding!! :)

