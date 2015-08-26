---
layout: post
permalink: long-term-evolution
comments: true
usemath: true
tags:
 - computer
 - programming
 - memo
 - tinker
title: 博客的长期演进
---

作为一个理想主义者，博客里凡是有看不顺眼的地方，我都会想办法解决。这里收集了一些小东西，相当于修修补补的手记。

<!--excerpt-->

###让首页仅显示文章预览

Jekyll默认在首页全篇显示一定数量的文章，而有时单个文章已经很长，全篇显示会显得比较臃肿，也不方便浏览。于是就有了split-excerpt这个组合。

在`index.html`加载`{% raw %}{{ post.content }}{% endraw %}`的地方，替换成如下语句：

	{% raw %}
	{{ post.content | split:'<!--excerpt-->' | first }}	{% endraw %}
	
然后在每篇文章合适的位置插入`{% raw %}<!--excerpt-->{% endraw %}`标志，这样一来首页上就只会显示该标志之前的内容。

但是问题来了，首页看起来是内容丰富多了，可是感觉都是没写完的文章：缺少一个“more”按钮。在`index.html`里修改过的地方后面再加一句：

	{% raw %}
	<a href="{{ site.baseurl }}{{ post.url }}">
      <p style="text-align:center">\(\{\)<b>继续看</b>\(\}\)
    </p></a>
    {% endraw %}

这样，首页上每一条文章节选的后面都会有一个连接，提示可以点进去看全文了。

……这又造成了一个问题：那些在首页就能完整显示的短文章下面，也会有个“继续看”的链接。革命尚未成功啊。

$$\rhd$$

###国内社交软件分享

之前在[建博](/making-of-this-blog/)的时候提到过，想加入国内网站常见的那种条状物。在网上搜索了一下，居然轻松找到：[JiaThis](http://www.jiathis.com/)。这名字起的，朴实，接地气。JiaThis提供了一次性解决问题的方案，不用注册，直接将提供的代码嵌入到合适的位置，就行了：

<!-- JiaThis Button BEGIN -->
<div class="jiathis_style">
	<span class="jiathis_txt">分享到：</span>
	<a class="jiathis_button_tools_1"></a>
	<a class="jiathis_button_tools_2"></a>
	<a class="jiathis_button_tools_3"></a>
	<a class="jiathis_button_tools_4"></a>
	<a href="http://www.jiathis.com/share" class="jiathis jiathis_txt jiathis_separator jtico jtico_jiathis" target="_blank">更多</a>
	<a class="jiathis_counter_style"></a>
</div>
<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>
<!-- JiaThis Button END -->
<br /> 

除了字有点小，图标有点丑（不清晰）以外，还是挺不错的。

$$\rhd$$