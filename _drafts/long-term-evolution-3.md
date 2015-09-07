---
layout: post
permalink: long-term-evolution-3
comments: true
use-math: true
tags:
 - computer
 - programming
 - memo
 - tinker
 - lte
title: 博客的长期演进III
---

这个系列的文章收集了平时维护博客时遇到的各种小问题、hack以及一些想法。

* [Better Related Posts, without Plugin]({{site.baseurl}}{{page.url}}/#Better Related Posts, without Plugin)
* [Sublime Text, Regular Expression]({{site.baseurl}}{{page.url}}/#Sublime Text, Regular Expression)
* [二维码，标签，图标和照片展示页]({{site.baseurl}}{{page.url}}/#二维码，标签，图标和照片展示页)

<!--excerpt-->

<div id="Better Related Posts, without Plugin" ></div>

### Better Related Posts, without Plugin

随着博客的文章慢慢多了起来，我发现每篇文章末尾那个Related Posts（类似文章）其实并不是特别地与主题相关，而且偶尔还能看到完全不相关的文章。上网逛逛，看看其他人有神马想法。

由于GitHub Pages支持的Jekyll插件很有限，所以能尽量不用插件的地方就不用。因为就算找到能解决问题的插件，也很可能因为GitHub Pages不支持而无法使用。于是我找啊找，很快就找到了一个上海交大的姑娘写的一篇文章，[Jekyll Related Posts without Plugin](http://zhangwenli.com/blog/2014/07/15/jekyll-related-posts-without-plugin/){:target="_blank"}。

她一开始用了别人写的一个插件，结果push到GitHub后发现插件不起作用。调查后发现GitHub Pages并不支持她用的那个插件。于是这个姑娘心一横，自己动手用`liquid`写了一段逻辑判断，实现了跟插件一样的效果。

不过我并没有用她的代码。不是因为代码有问题，我读过也试过了，代码没有问题。问题在于判断related posts的关键在与寻找拥有相同tag（标签）数量较多的文章。而我的博客上，很多旧博文根本就没有设标签，所以再怎么寻找也是没有。所以只有先放一下，把标签完善了，再来偷代码。

$$\rhd$$

<div id="Sublime Text, Regular Expression" ></div>

### Sublime Text, Regular Expression

自从建了这个博客以后，写了不少代码。代码写多了，重复的也很多。`HTML`是给机器读的语言，让人来编写的话难免过于繁冗。所以各种节约按键数量的方法也在我的研究范围里。最开始我用[MacDown](http://macdown.uranusjr.com/){:target="_blank"}写文，清爽直观，操作简单。但是随着我折腾的东西越来越复杂，简单的Markdown远远无法满足需求。比如用PhotoSwipe创建的照片幻灯，每插入一张图要这么多代码：

	<div class="imgDisplay monoh" style="" itemscope itemtype="http://schema.org/ImageGallery">
	  <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
	  <a href="image path" itemprop="contentUrl" data-size="" >
	  <img src="image path" itemprop="thumbnail" 
	    title="image description" 
	    alt="image description" /></a>
	  <figcaption itemprop="caption description">image description</figcaption>
	  </figure>
	</div>

因为每张图的名称、描述都不一样，简单的手动复制粘贴都会耗费许多时间和精力。所以必须把效率提高一些，减少一些不必要的劳动，把脑子用到值得思考的问题上。于是我转移到了神器[Sublime Text](http://www.sublimetext.com/){:target="_blank"}里面写文。原本我只是在ST里改改`HTML`之类，但是多花了一点时间在上面之后，我发现我之前完全是在以错误的方式使用这个软件。

于是开始下载各种插件，换主题，自己编一些快捷方式，减少重复劳动。现在，我只要输入`pswp`然后<kbd>Tab</kbd>，就能插入上面那段代码。然后研究Regex（正则表达式），进一步减少重复劳动（懒嘛）。

这一天一夜的成果可以用这一句Regex来概括：`(^[^x\d]+$)|(^.+-)|(\..+$)`。这串看似乱码的东西，解释起来挺拗口，直接看效果：

	文本1：/assets/photos/some-picture-1024x768.jpg
	文本2：/assets/photos/some-picture.jpg
	文本2：/assets/photos/some-picture-2123x12332-1200x1000.jpg

用`(^[^x\d]+$)|(^.+-)|(\..+$)`搜索，然后删除所有匹配的项目，上面三个文件名变成了

	文本1：1024x768
	文本2：（啥也没有）
	文本2：1200x1000

效果就是寻找文件名中最末尾关于图片大小的那串字符。当然要先做到文件名都统一这么写，才能如此抓取。这个例子可以在[RegExr](http://www.regexr.com/){:target="_blank"}上查看：[Extract Dimension](http://regexr.com/3bntb){:target="_blank"}

$$\rhd$$

<div id="二维码，标签，图标和照片展示页" ></div>

### 二维码，标签，图标和照片展示页

在[操场]({{site.baseurl}}/playground/)上试验成功的东西，都有了专门的页面。这些展示页是用来陈列我每次无尽折腾之后的成果，也是为了备忘。目前已经完成的有：

* [分享网页地址的二维码按钮]({{site.baseurl}}/demo-qr-code-in-tooltip/)
* [相片展示手段]({{site.baseurl}}/demo-photoswipe-gallery/)
* [自由控制嵌入的框架大小]({{site.baseurl}}/demo-iframe-containers/)
* [文章标签汇总]({{site.baseurl}}/tags/)
* [Font Awesome图标清单]({{site.baseurl}}/fa-icon-list/)

这些东西，都是可能会加入到博客正是页面中来的。先放在那，免得要用的时候忘记了怎么做。
