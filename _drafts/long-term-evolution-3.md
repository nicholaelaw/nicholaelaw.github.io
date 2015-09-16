---
layout: post
permalink: long-term-evolution-3/
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
* [节约流量：二维码按钮、评论按需加载，插入footer]({{site.baseurl}}{{page.url}}/#节约流量：二维码按钮、评论按需加载，插入footer)
* [`sitemap.xml`，再度统一permalink]({{site.baseurl}}{{page.url}}/#`sitemap.xml`，再度统一permalink)
* [用Class来重新定义Style，而不是直接修改DOM Object]({{site.baseurl}}{{page.url}}/#用Class来重新定义Style，而不是直接修改DOM Object)

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
* [按需加载JavaScript]({{site.baseurl}}/demo-jquery-on-demand/)

这些东西，都是可能会加入到博客正是页面中来的。先放在那，免得要用的时候忘记了怎么做。

<div id="节约流量：二维码按钮、评论按需加载，插入footer" ></div>

### 节约流量

一连做了好多东西，准备投入使用。根据节约流量的原则，要尽量压缩客户端下载的文件数量和大小，所以一般情况下页面都只是加载了必要的东西。目前默认会加载以下数据：

1. 基础框架：`Poole.css`，`Lanyon.css`，`Syntax.css`；
2. Font Awesome图标集（CSS）；
3. PhotoSwipe（CSS）；
4. 自定义的附加CSS文件；
5. 根据页面的开关设置，可能会加载PhotoSwipe，Disqus评论系统，jQuery和MathJax的JavaScript；

一般仅有不多文字的页面，流量消耗在200KB以下，压缩传送的数据应该更小（20%？）。对于包含较多图片的，消耗流量比较多的页面，如果读者选择浏览那么他就要下载相关的数据，这种流量不在节约的考虑范围内。要节约的是对于一般浏览没有影响的功能所产生的流量。目前已经实施的流量节约手段有

1. 将基础框架、FA和PhotoSwipe的CSS合并压缩，大小由71KB缩减为48KB（节约33%），文件数由6个减为1个；
2. 在页面设置开关，仅加载当前页面需要的CSS和JS；
3. 合并经常一起使用的JavaScript，并压缩。例如将`tooltispter.js`与`jquery-qrcode.js`合并，大小由63KB减为31KB（节约51%），`photoswipe.js`与`photoswipe-ui-default.js`合并，大小由115KB减为40KB（比原来分别压缩过的文件还减了2KB）等。

这次做的改动，是将分享和评论部分改为按需加载。去掉了JiaThis的分享工具栏（太丑且无用），取而代之一个自动生成当前页面的二维码的按钮。Disqus的评论模块默认不加载，改为一个“看评论”的按钮，点击后显示评论模块。这样做的好处是，不会无意中增加流量消耗[^bandwidth]。

[^bandwidth]: 实测结果是，就算是一条评论也没有，Disqus评论系统也会消耗大约400KB左右的流量；有时这比原本页面的流量还多。虽说评论只有在拉倒页面底部的时候才开始加载，但误操作的可能性还是很高。因为一般人的使用习惯应该是一直往下滚动页面，直到滚不动为止。这样的话就会触发加载评论，浪费流量。

这些工作还是费了我好一番功夫。因为二维码分享需要用到jQuery、tooltipster和qrcode三个脚本，而页面默认情况下并不会加载这些东西（压缩后大约127KB），所以必须做到点击按钮时先确认需要加载的js，然后再运行生成二维码的代码。这些工作的细节我另建了一个[展示页面]({{site.baseurl}}/demo-jquery-on-demand/)。

值得注意的是，对于利用Jekyll建成的网站，加载Disqus评论系统的时候务必要使用`disqus_identifier`来识别文章，否则在本地测试能够显示的评论数量，传至GitHub Pages后就消失了。具体使用方法见 [Disqus官方说明文档](https://help.disqus.com/customer/portal/articles/472098-javascript-configuration-variables#disqus_identifier){:target="_blank"}。

最后加入了`footer.html`，定义本博的版权策略为[CC-BY-SA](https://creativecommons.org/licenses/by-sa/4.0/deed.zh_TW){:target="_blank"}，大概意思是随意分享、修改、使用但必须注明出处并以相同方式分享。不过奇怪的是其官网上并没有简体中文版。难道天朝官方不认可该协议的有效性？还是没人愿意贡献时间和精力去翻译呢？简单翻译我没问题，但是涉及法律文本的话，恐怕要专业人士来才靠谱。

OK，其它的小地方，就无需多做解释了。

$$\rhd$$

<div id="`sitemap.xml`，再度统一permalink" ></div>

### `sitemap.xml`，再度统一permalink

虽然我不怎么关心搜索引擎的优化（也不指望有人在网上搜这里），但是一个健全的网站还是必须有个sitemap，所以从[这里](http://davidensinger.com/2013/03/generating-a-sitemap-in-jekyll-without-a-plugin/){:target="_blank"}偷来一段不用插件生成sitemap的代码，稍作修改就投入使用。

但在[Google Webmaster Tools](http://www.google.com/webmasters/tools){:target="_blank"}里面闲逛的时候发现如果permalink后面没有`/`的话，会发生一次跳转，影响收录的过程。所以将所有文章的permalink后面都加上了`/`，算是定下了以后设置permalink的规范。

生成了`sitemap.xml`，就可以去Webmaster Tools里面提交。提交后可以看到发现的页面数（目前81，非常地mini）；之后就可以等Google慢慢地把这个小博客收录到索引中了[^baidu]。

[^baidu]: 我也尝试了在百度的站长工具里加入博客的sitemap，但是百度无法抓取GitHub上的任何内容。原因是今年四月份的网络攻击案之后，GitHub屏蔽了所有来自百度UA的请求。所以，被人当枪使的百度从此无法访问GitHub了。不能收录更好，反正从来都没用过百度的服务。

$$\rhd$$

<div id="用Class来重新定义Style，而不是直接修改DOM Object" ></div>

### 用Class来重新定义Style，而不是直接修改DOM Object

今天又得到了一个教训，那就是用CSS定义style的时候，不要去override原来的DOM Object除非所有的CSS都在你的掌控之中。我在折腾几个按钮的时候发现Lanyon自带的CSS里面并没有对`button`进行定义，导致摆出来的按钮又小又丑。所以我在自己的CSS里面加入了下面这样一段定义：

	/* Default button style */
	button {
	  background-color:#ac4142;
	  display:inline-block;
	  cursor:pointer;
	  color:#ffffff;
	  font-size: 1rem;
	  padding:6px 15px;
	  border:0;
	  margin-bottom: 1rem;
	}
	button:hover {
	  background-color:#ac4142;
	}
	button:active {
	  position:relative;
	  top:1px;
	}

这样按钮的风格就和其它东西一致了。这样定义直接影响了所有的`button`对象，在当时来说，我觉得这就是我的目的。结果几天以后我发现PhotoSwipe的上一页/下一页失效了！点击的时候按钮没有任何效果，感觉就好像是透明的一般，点上去会触发它下面那一层对象的点击事件。举个例子，如果按钮下方是空白（也就是说，下面是黑色的背景），那么点一下就会关闭slide；如果按钮下方是图像（屏幕较窄的时候），点按钮会触发缩放。

这下搞得我一阵慌乱，到处检查代码。最后冷静下来，仔细分析，觉得应该问题出在按钮本身。因为键盘控制没问题，滑动控制也没问题，唯独鼠标点击出了问题。于是打开Chrome的调试台，审查这个按钮元素的细节。结果一下就发现了问题所在。

PhotoSwipe的UI按钮是以`.pswp_button`等class来定义的。我却无意间在`button`对象上强加了许多style。估计是我的CSS和PhotoSwipe的CSS起了冲突，而最后我的CSS赢了，于是按钮就失效了。知道了问题所在，就好解决了。我不再笼统地定义`button`对象的style，改为定义`defaultBtn`这个class。修改之后，PhotoSwipe又恢复了正常。悬着的一颗心终于落地了。

* [Liquid Nonsense]({{site.baseurl}}{{page.url}}/#Liquid Nonsense)

<div id="Liquid Nonsense" ></div>

### Liquid Nonsense

用Liquid写东西直接把我写疯了。Liquid的语法太TM蛋疼，简直是不让人活了。

PACE.js Embedded fonts

