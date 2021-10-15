---
layout: post
title: Ajax loading of product collection in product listing page - Magento
date: 2013-11-26 13:10:31.000000000 +05:30
categories:
- technical
tags:
- posts
- magento
- ajax
- load products
- magento
- product listing
- product loading
status: publish
type: post
published: true
author: Venkateshwar
header-img: "img/home-bg.jpg"
---
<p>Today I got in to a situation where I need to do ajax loading of project collection in product listing page. if we search for the same issue on google then we will get many extensions which are free but they include plugins like <code>infinitescroll.js</code>,  <code>jquery.js</code>, <code>jquery-ui.js</code> etc.. instead of this you can use <code>prototype.js</code> which is available by default in magento. Actually, this task is simple if we understand it.</p>
<p>By default, Magento shows product listing in page wise format. Each page numbering is a anchor tag with href which loads the complete page with new project listing related to the clicked page number.</p>
<p>In this example, I am going to create a simple product loading which happens whenever I click on a button. This button will be visible at the bottom of the product listing section, if the product collection is more than one page. <strong>Place this button inside <code>{$theme}/template/catalog/product/list.phtml</code></strong>.This button actually triggers the "Next" functionality link which you can see in the below image:</p>
<p><a href="http://kamlekar.files.wordpress.com/2013/11/capture.png"><img src="assets/capture.png" alt="Capture" width="169" height="63" class="alignnone size-full wp-image-140" /></a></p>
<p>So, whenever we click on the button this actually gets the next page product collection. If we inspect the "Next" link element (<em>which is shown in the above image</em>), we can see that it has two class names: <code>next</code> and <code>i-next</code>. So, to trigger click event on this element with the button we can use javascript.</p>

```javascript
<button id="load-more-products">Load more products..<button>
```

```javascript
function sendLoadMoreProductsRequest(url) {
	new Ajax.Request(url, {
	  	onSuccess: function(response) {
	  		//Create dummy element
	  		var div = document.createElement('div');
	  		div.innerHTML = response.responseText;
	  		//refresh the page class element
	  		$$('.pages')[0].innerHTML = $(div).select('.pages')[0].innerHTML;
	  		//append the list to the existing product list
	  		$$('.category-products')[0].innerHTML += $(div).select('.category-products')[0].innerHTML;
	  		//check if there are more products to be loaded or not
	  		if(!$(div).select('.next.i-next')[0]){
	  			$('load-more-products').style.display = "none";
			}
	  	}
	});
}

function callbackFunc(e) {
	if($$('.next.i-next')[0]){
		var nextPageUrl = $$('.next.i-next')[0].readAttribute('href');
		sendLoadMoreProductsRequest(nextPageUrl);
	}
	else{
		//hide button
		$$(e.currentTarget).hide();
	}
}

//Assigning click event to the button which triggers the "next" link
$('load-more-products').observe('click', callbackFunc);
```

<p><strong>Note:</strong> In some cases, when the category has less product collections then still the button will be visible. To hide this button add the below code inside the <code>list.phtml</code> template file at very end.</p>

```javascript
<script>
//<![CDATA[
    //check if there are more products to be loaded or not
    if(!$$('.next.i-next')[0]){
        $('load-more-products').style.display = "none";
    }
    function testScroll(ev){
        if($$('.scroll-to-top')[0]){
            console.log(window.pageYOffset);
            if(window.pageYOffset>400){
                $$('.scroll-to-top')[0].style.display = "block";
            }
            else{
                $$('.scroll-to-top')[0].style.display = "none";
            }
        }
    }
    window.onscroll = testScroll;
//]]>
</script>

```

<p>Now just hide the default page numbering group of elements using styling properties like <code>display: none;</code></p>
<p>This worked for me on magento 1.8. I hope this works for you too as I am not doing any big changes here :) </p>
