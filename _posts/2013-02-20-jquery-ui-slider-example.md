---
layout: post
title: jQuery UI Slider Example
date: 2013-02-20 12:21:30.000000000 +05:30
categories:
- technical
tags:
- Projects
- Style
- Technology
- Tips
status: publish
type: post
published: true
author:     "Venkateshwar"
header-img: assets/img/home-bg.jpg"
---
<p style="text-align:justify;">Recently, I created a slider using jQuery UI. Many thanks to Stackoverflow.com because with no experience in jQuery-UI, I have done this slider just by searching on it. This is a simple slider example which is based on a single event of it i.e 'slide'. If you want to have more sliders, then just edit the variable <strong>slideCount</strong> value. I hope the comments in between the code of lines will help you to understand what I did here. If you have any doubts or suggestions, please feel free to leave a comment below.</p>
<p>(Please attach your own image files in the place of <strong>stripeRed.png</strong> and <strong>stripeGreen.png</strong> in jQuery file)</p>
<p>Here is the code:</p>
<pre>
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
  &lt;script type=&quot;text/javascript&quot; src=&quot;//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js&quot;&gt;&lt;/script&gt;
  &lt;link rel=&quot;stylesheet&quot; href=&quot;http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css&quot; type=&quot;text/css&quot;/&gt;

	&lt;script src=&quot;http://code.jquery.com/ui/1.10.0/jquery-ui.js&quot;&gt;&lt;/script&gt;
	&lt;script type=&quot;text/javascript&quot;&gt;

		$(document).ready(function() {
			//give number of sliders to be generated here
			var slideCount = 3;
			//Generating each slider dynamically.
			for(var intCount=0;intCount&lt;slideCount;intCount++){
				$(&quot;#slider&quot;).append('&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;divValue&quot;&gt;0&lt;/div&gt;&lt;/div&gt;')
			}

			//getting the position of the sliders on the page.
			var divPosition = $(&quot;#slider&gt;div&gt;div&quot;).offset().left;
			//getting the width of one of the slider.
			var width = $(&quot;#slider&gt;div&gt;div&quot;).width();
			//Calculating the middle value on the page.
			var offsetPosition = (divPosition + width/2);

			//Converting the selected div's as sliders by doing the below code.
			var firstChild = $(&quot;#slider&gt;div&quot;).children('div:nth-child(1)');
			firstChild.slider(
		  	{
		    	min: -100,
		    	max: 100,
		      	step: 1,
		      	slide: showValue  //calling slide event
		  	});

		  	//This function is used to show the value selected by the user in the range of -100 to 100.
		  	function showValue(event, ui) {
		  		//showing the value in the sibling div of the slider div which value has been changed.
			  	$(this).parent('div').children('div:nth-child(2)').html(ui.value);

			  	//if the slided value is less than zero
			 	if(ui.value&lt;0){
			  		//change background color to red
			  		var anchorOffset = $(this).children('a').offset().left;
			  		$(this).children('div').css({'width': offsetPosition - anchorOffset,'right':divPosition - 10,'background-image':'url(&quot;images/stripeRed.png&quot;)','left':'auto'});

			  	}
			  	//if the slided value is greater than zero
			  	else if(ui.value&gt;0){
			  		//change background color to green.
					var anchorOffset = $(this).children('a').offset().left;
			  		$(this).children('div').css({'width': anchorOffset - offsetPosition,'left':divPosition - 5,'background-image':'url(&quot;images/stripeGreen.png&quot;)','right':'auto'});
			  	}

			  	//if the slided value is equal to zero.
			  	else{
			  		$(this).children('div').css({'width': '0'});
			    }
		  	}
		});
	&lt;/script&gt;
	&lt;style&gt;
		#mainSlider{width:50%;margin: 0 auto;margin-top:100px;}
		#slider&gt;div{margin-bottom:50px;}
		#slider&gt;div&gt;div:nth-child(2), .divValue{font-family:consolas;background-color:silver;border:1px solid gray;width:75px;border-radius:15px;text-align:center;margin-top:5px;}
		#slider&gt;div&gt;div&gt;div{position:absolute;height:100%;}
	&lt;/style&gt;
&lt;/head&gt;
	&lt;body&gt;
		&lt;div id=&quot;mainSlider&quot;&gt;
			&lt;div id=&quot;slider&quot;&gt;
			&lt;/div&gt;
		&lt;/div&gt;
	&lt;/body&gt;
&lt;/html&gt;
</pre>
