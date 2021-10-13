---
layout: post
title: Social sharing of url using PHP/magento
date: 2014-02-04 08:53:18.000000000 +05:30
categories:
- technical
tags:
- magento
- php
- facebook
- google plus
- magento
- share product url
- social sharing
- twitter
status: publish
type: post
published: true
author:     "Venkateshwar"
header-img: "img/home-bg.jpg"
---
<p>Here is the code for sharing url in magento. In the below code, I am sharing the specific product url which is referred as <code>$_product</code>. If you want to change the url then just change the value of the variable <code>$product_url</code>. The below example is for sharing url in <strong>Facebook, twitter and google plus</strong>. Enjoy!!</p>
<pre>
            &lt;div class="share-button curPointer" title="Share project link"&gt;
                &lt;script type="text/javascript"&gt;
                //&lt;![CDATA[
                // Popup window code
                function newPopup(url) {
                    popupWindow = window.open(
                        url,'popUpWindow','height=700,width=800,left=10,top=10,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no,status=yes')
                }
                //]]&gt;
                &lt;/script&gt;
                &lt;ul class="share-button-ul"&gt;
                    &lt;?php
                        $product_url = $_product-&gt;getProductUrl();
                        $shareUrl = urlencode($product_url);
                        $shareVia = urlencode("via_name");
                        $shareText = urlencode("");
                    ?&gt;
                    &lt;li&gt;
                        &lt;a class="share-button-link" href="JavaScript:newPopup('&lt;?php echo "https://www.facebook.com/sharer/sharer.php?u=" .$shareUrl; ?&gt;');"&gt;
                            &lt;div class="share-btn-icon facebook-icon"&gt;
                            &lt;/div&gt;
                            &lt;div&gt;Facebook&lt;/div&gt;
                        &lt;/a&gt;
                    &lt;/li&gt;
                    &lt;li&gt;
                        &lt;a class="share-button-link" href="JavaScript:newPopup('&lt;?php echo "https://twitter.com/intent/tweet?url=".$shareUrl."&amp;via=". $shareVia."&amp;text=". $shareText;?&gt;');" data-count="none"&gt;
                            &lt;div class="share-btn-icon twitter-icon"&gt;
                            &lt;/div&gt;
                            &lt;div&gt;Twitter&lt;/div&gt;
                        &lt;/a&gt;
                    &lt;/li&gt;
                    &lt;li&gt;
                    &lt;?php //$product_url = "http://www.google.com"; ?&gt;
                        &lt;a class="share-button-link" href="JavaScript:newPopup('&lt;?php echo "https://plus.google.com/share?url=". urlencode($product_url); ?&gt;');"&gt;
                            &lt;div class="share-btn-icon plus-icon"&gt;
                            &lt;/div&gt;
                            &lt;div&gt;Google Plus&lt;/div&gt;
                        &lt;/a&gt;
                    &lt;/li&gt;
                &lt;/ul&gt;
            &lt;/div&gt;</pre>
