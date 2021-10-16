---
layout: post
title: Social sharing of url using PHP/magento
date: 2014-02-04 08:53:18.000000000 +05:30
categories:
- technical
tags:
- posts
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
author: Venkateshwar
header-img: "img/home-bg.jpg"
---
<p>Here is the code for sharing url in magento. In the below code, I am sharing the specific product url which is referred as <code>$_product</code>. If you want to change the url then just change the value of the variable <code>$product_url</code>. The below example is for sharing url in <strong>Facebook, twitter and google plus</strong>. Enjoy!!</p>

```css
<div class="share-button curPointer" title="Share project link">
    <script type="text/javascript">
    //<![CDATA[
    // Popup window code
    function newPopup(url) {
        popupWindow = window.open(
            url,'popUpWindow','height=700,width=800,left=10,top=10,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no,status=yes')
    }
    //]]>
    </script>
    <ul class="share-button-ul">
        <?php
            $product_url = $_product->getProductUrl();
            $shareUrl = urlencode($product_url);
            $shareVia = urlencode("via_name");
            $shareText = urlencode("");
        ?>
        <li>
            <a class="share-button-link" href="JavaScript:newPopup('<?php echo "https://www.facebook.com/sharer/sharer.php?u=" .$shareUrl; ?>');">
                <div class="share-btn-icon facebook-icon">
                </div>
                <div>Facebook</div>
            </a>
        </li>
        <li>
            <a class="share-button-link" href="JavaScript:newPopup('<?php echo "https://twitter.com/intent/tweet?url=".$shareUrl."&amp;via=". $shareVia."&amp;text=". $shareText;?>');" data-count="none">
                <div class="share-btn-icon twitter-icon">
                </div>
                <div>Twitter</div>
            </a>
        </li>
        <li>
        <?php //$product_url = "http://www.google.com"; ?>
            <a class="share-button-link" href="JavaScript:newPopup('<?php echo "https://plus.google.com/share?url=". urlencode($product_url); ?>');">
                <div class="share-btn-icon plus-icon">
                </div>
                <div>Google Plus</div>
            </a>
        </li>
    </ul>
</div>
```
