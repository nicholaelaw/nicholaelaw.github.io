---
layout: post
permalink: long-term-evolution/
comments: true
use-math: true
tags:
- computer ≌ 计算机
- programming ≌ 编程
- memo ≌ 备忘
- tinker ≌ 折腾
- lte ≌ 长期演进
title: 博客的长期演进
---

这个系列的文章收集了平时维护博客时遇到的各种小问题、hack以及一些想法。

* [让首页仅显示文章预览]({{site.baseurl}}{{page.url}}/#让首页仅显示文章预览)
* [国内社交软件分享]({{site.baseurl}}{{page.url}}/#国内社交软件分享)
* [加入`.gitignore`]({{site.baseurl}}{{page.url}}/#加入`.gitignore`)
* [启用删除线]({{site.baseurl}}{{page.url}}/#启用删除线)
* [给网站加上图标]({{site.baseurl}}{{page.url}}/#给网站加上图标)

<!--excerpt-->

<div id='让首页仅显示文章预览'></div>

### 让首页仅显示文章预览

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

……这又造成了一个问题：那些在首页就能完整显示的短文章下面，也会有个“继续看”的链接。革命尚未成功啊。[^excerpt]

[^excerpt]: 解决办法：在Front Matter里加入变量`noexcerpt`，然后在`index.html`里进行判断，如果Front Matter中有`noexcerpt: true`则直接显示全文，同时不显示“继续看”。如果没有（默认为`false`），则显示摘要。

$$\rhd$$

<div id='国内社交软件分享'></div>

### 国内社交软件分享[^jiathis]

[^jiathis]: 后来在网上又搜到了[AddThis](http://www.addthis.com/)，才发现JiaThis的名字根本就是跟人家学的。AddThis的图标看着都特干净，美观整齐，大小合适。可惜的是AddThis貌似没有微博、微信这些国内现在最流行的社交软件，而且貌似有撞墙的嫌疑。算了，另外想办法吧。实在不行的话，自己找几个好看的图标试试能不能给它换掉。

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

<div id='加入`.gitignore`'></div>

### 加入.gitignore

为了节省GitHub资源，有些不必要上传的东西可以加入到`.gitignore`文件里；GitHub甚至有个repo专门收集各种工作环境下的[`.gitignore`](https://github.com/github/gitignore)文档。对于Jekyll来说，自动生成的`_site`文件夹是不必上传的。因为传说中GitHub Pages本身就会忽略其内容，根据源文件编译生成网站。

由此我又得出了另外一个重要结论，那就是既然在GitHub Pages上使用Jekyll无需在本地build，那么在任何地方、任何设备上，只要能够将写好的文档push到GitHub，就算是发布了？为啥这个情况没有被反复强调呢？害我纠结很久怎么在手机上写文章。

$$\rhd$$

<div id='启用删除线'></div>

### 启用删除线

又发现一个问题：默认状态下，Jekyll的Markdown处理器不支持删除线标记`~~`。要启用删除线标记，在`_config.yml`末尾加入

	markdown:         redcarpet 
	redcarpet:   
	  extensions:     ["strikethrough"]

删除线就启用了。然而这么做导致TeX语法不能正确parse，用到MathJax的地方全部乱套！我猜想可能是启用`strikethrough`的同时也启用了`highlight`，或者其它的什么东西。既然不能用Markdown，那回归本源，直接上HTML总该没问题了吧：

	<del>删除我</del>
	
<del>各种悲催。</del>

$$\rhd$$

<div id="给网站加上图标"></div>

### 给网站加上图标

给博客定制个图标吧！Lanyon默认的是个“L”：

<div style="position: relative; max-width: 152px; margin: 0 auto;">
    <figure style="margin-left: 0; margin-right: 0;
        max-width: 100%;">
    <img title="Poole's Theme, Lanyon"
        src="/assets/images/lanyon-default-favicon-apple.png" 
        alt="Poole's Theme, Lanyon"
        style="margin-bottom:0;"/>
        <figcaption style="color: white;
            background-color: black;
            text-align: center;">
            Lanyon</figcaption>
    </figure>
</div>

虽说看着还不错，但一个默认的图标终归没有辨识度。打开Illustrator，自己做一个吧。我把原始文件的尺寸设为\\( 1024\times 1024\\)，这样downsize的时候效果会好一些。怎么做，做成什么样，都看个人喜好，我就不多说了。

做好底稿后，需要生成一大串各种大小的图标文件。人肉做的话，也行……但是我找到一个可以说是专业级的图标生成网站：[Real Favicon Generator](http://realfavicongenerator.net/){:target="_blank"}。不仅给你生成普通浏览器用的图标，连Android、iOS添加到主屏幕的图标都有！各种舒畅啊。

最后秀一个本博图标的大图：

<div style="position: relative; max-width: 600px; margin: 0 auto;">
    <figure style="margin-left: 0; margin-right: 0;
        max-width: 100%;">
    <img title="三喵暖"
        src="/assets/images/favicon-cutout-1024.png" 
        alt="三喵暖"
        style="margin-bottom:0;"/>
        <figcaption style="color: black;
            background-color: white;
            text-align: center;">
            三喵暖</figcaption>
    </figure>
</div>

哈哈哈哈……[^laugh]

[^laugh]:此处充满了各种得意。

$$\square$$
