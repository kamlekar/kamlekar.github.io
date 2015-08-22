---
layout: post
title: Overriding Block or Model in magento
date: 2013-11-22 14:13:24.000000000 +05:30
categories:
- technical
tags:
- block
- blocks
- magento
- model
- override
- rewrite
status: publish
type: post
published: true
author:     "Venkateshwar"
header-img: "img/home-bg.jpg"
---
<p>Here I am going to explain some points which must be considered while overriding a Mage's php class. I am  going to explain it step by step with example as overriding a model which is <strong><code>Mage_Review_Model_Resource_Review</code></strong> and the function to which I am overriding is <strong><code>_afterSave()</code></strong>.</p>
<li>For overriding a class, you should create a new module (<em>which is identical to the name of the module to which we are overriding</em>) in <strong><code>app/code/local/{company_name}</code></strong> folder. Here <code><strong>{company_name}</strong></code> could be anything which you think would be unique throughout your project just like core files name "Mage".</li>
<li>The created module should be registered in <strong><code>app/etc/modules folder</code></strong>. </li>
<pre>
    &lt;config&gt;
        &lt;modules&gt;
            &lt;Company_Review&gt; &lt;!-- same like &quot;Mage_Review&quot; --&gt;
                &lt;active&gt;true&lt;/active&gt;
                &lt;codePool&gt;local&lt;/codePool&gt;
            &lt;/Company_Review&gt;
        &lt;/modules&gt;
    &lt;/config&gt;
</pre>
<li>Keep the directory structure of the overriding class (a model or block) same as the core class'.</li>
<li>Keep the class name same as the core class name.
<p>For example:  If you are planning to override <strong><code>Mage_Review_Model_Resource_Review</code></strong> class then your overriding class should replace the "Mage" with <strong><code>{company_name}</code></strong>.</p>
</li>
<pre>
   Mage_Review_Model_Resource_Review =&gt; Company_Review_Model_Resource_Review
</pre>
<li>In the php class file, extend our created class to the overridden class and include its path from "Mage" folder.
<p>For example,</p>
<p /></li>
<pre>
&lt;?php
include_once(&quot;Mage/Review/Model/Resource/Review.php&quot;);
class Company_Review_Model_Resource_Review extends Mage_Review_Model_Resource_Review
{
    protected function _afterSave()  //overriding function
    {
        //code here
    }
}
</pre>
<li>Register your classes in <code><strong>local/{company_name}/{module_name}/etc/config.xml</strong></code> file</li>
<pre>
&lt;?xml version=&quot;1.0&quot;?&gt;
&lt;config&gt;
    &lt;modules&gt;     &lt;!-- Optional, but good practice to include this --&gt;
        &lt;Company_Review&gt;
            &lt;version&gt;1.0&lt;/version&gt;
        &lt;/Company_Review&gt;
    &lt;/modules&gt;
    &lt;global&gt;
        &lt;models&gt;  &lt;!-- would be &quot;blocks&quot; if you are overriding a block class --&gt;
        	&lt;companyreview&gt; &lt;!-- should be unique.. to keep it simple just add your company name to the cores class reference name --&gt;
        		&lt;class&gt;Efk_Review_Model&lt;/class&gt;   &lt;!-- register of main class --&gt;
        	&lt;/companyreview&gt;
            &lt;review&gt;   &lt;!-- core file&#039;s module name --&gt;
                &lt;rewrite&gt;
                    &lt;resource_review&gt;Efk_Review_Model_Resource_Review&lt;/resource_review&gt;
                &lt;/rewrite&gt;
            &lt;/review&gt;
        &lt;/models&gt;
    &lt;/global&gt;
&lt;/config&gt;
</pre>
<p>The above layout is happened as shown in the below image:<br />
<img src="assets/h16ROyO.png" alt="magento 1" /></p>
<p>Now everything seems all set but there could be some issues related to the above config.xml file.<br />
Observe the below section which is excerpt from the above <strong><code>config.xml</code></strong> file</p>
<pre>
&lt;review&gt;   &lt;!-- core file&#039;s class reference name --&gt;
      &lt;rewrite&gt;
             &lt;resource_review&gt;Efk_Review_Model_Resource_Review&lt;/resource_review&gt;
      &lt;/rewrite&gt;
&lt;/review&gt;
</pre>
<p>In the above code, the class references name which I mentioned is "review" which I am thinking to be correct after visiting the original module's config.xml. Lets once visit the original module's config.xml file which in our example case should be in <strong><code>app/code/core/Mage/Review/etc/config.xml</code></strong> file. The excerpt code is shown below:</p>
<pre>
&lt;config&gt;
    &lt;!-- some other code --&gt;
    &lt;global&gt;
        &lt;models&gt;
            &lt;review&gt;
                &lt;class&gt;Mage_Review_Model&lt;/class&gt;
                &lt;resourceModel&gt;review_resource&lt;/resourceModel&gt;
            &lt;/review&gt;
            &lt;review_resource&gt;
                &lt;class&gt;Mage_Review_Model_Resource&lt;/class&gt;
	&lt;!-- some other code --&gt;
            &lt;/review_resource&gt;
        &lt;/models&gt;
&lt;/config&gt;
</pre>
<p>As you can see above, there seems to be two types of class references(I don't know what exactly they are) one is "&lt;review&gt;" and the other one is "&lt;review_resource&gt;". As in our example we are planning to override Mage_Review_Model_Resource_Review which should be referring from "&lt;review_resource&gt;" instead of "&lt;review&gt;". So, our overriding modules config.xml will change something like this:</p>
<pre>
&lt;?xml version=&quot;1.0&quot;?&gt;
&lt;config&gt;
    &lt;modules&gt;
        &lt;Company_Review&gt;
            &lt;version&gt;1.0&lt;/version&gt;
        &lt;/Company_Review&gt;
    &lt;/modules&gt;
    &lt;global&gt;
        &lt;models&gt;
            &lt;companyreview&gt;
                &lt;class&gt;Company_Review_Model&lt;/class&gt;
            &lt;/companyreview&gt;
            &lt;review_resource&gt;
                &lt;rewrite&gt;
                    &lt;review&gt;Company_Review_Model_Resource_Review&lt;/review&gt;
                &lt;/rewrite&gt;
            &lt;/review_resource&gt;
        &lt;/models&gt;
    &lt;/global&gt;
&lt;/config&gt;
</pre>
<p>So, the correct layout is based on the following image:</p>
<p><img src="assets/zXjSrs8.png" alt="magento 2" /></p>
<p>Now we are done and everything is perfect but sometimes still there could be issues.</p>
<p>Sometimes the function which we are overriding calls a function with same name available in the parent class. So, care must be taken to call the original class's parent class with name instead of using <strong><code>parent</code></strong> php keyword.</p>
<p>For example: </p>
<p>In our case, if the <strong><code>_afterSave()</code></strong> function has a line <strong><code>return parent::_afterSave()</code></strong> (<em>which doesn't have in real code</em>), then call the original class's parent class with name like <strong><code>Mage_Core_Model_Resource_Db_Abstract</code></strong> in the overrided class function. <strong>This will make sure that the overridden class is not overridden again by the original class. </strong></p>
<p>If still you can't see the changes then re-indexing and clearing the cache will help.</p>
<p>Thanks for reading my blog. Let me know if I missed something by adding comments below :)</p>
