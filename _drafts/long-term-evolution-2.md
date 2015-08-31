---
layout: post
permalink: long-term-evolution-2
comments: true
use-math: true
tags:
 - computer
 - programming
 - memo
 - tinker
title: 博客的长期演进II
---

这个系列的文章收集了平时维护博客时遇到的各种小问题、hack以及一些想法。

* [隐藏页面和Permalink]({{site.baseurl}}{{page.url}}/#隐藏页面和Permalink)
* [CSS一知半解：图片置中]({{site.baseurl}}{{page.url}}/#CSS一知半解：图片置中)

<!--excerpt-->

<div id='隐藏页面和Permalink'/>

###隐藏页面和Permalink

隐藏页面：我想在博客里建一个页面， 专门用来测试一些网上学来的东西。可是又不想让它的链接出现在任何地方，所以要想个办法把它藏起来。在Front Matter中使用`hide-page`参数。在`sidebar.html`中加入判断语句`node.hide-page != true`，隐藏明确设置了该参数的页面。

Permalink：我在给页面[^page]设置permalink的时候发现一个怪问题：那就是不设置还好，一旦设置了比如`permalink: test`，点击这个页面的链接就会将其数据作为文件下载。结果就是设置了permalink的页面反而不能正常显示。误打误撞地，当我在permalink后加了`/`时，页面就能正常显示了。后来在Jekyll的官方文档里，看到有这么一段话：

> Jekyll supports permalinks that contain neither a trailing slash nor a file extension, but this requires additional support from the web server to properly serve.[^permalink]

翻译：目前Jekyll目前支持末尾没有`/`或者扩展名的permalink，不过这要求网页服务器的兼容。

按照这个逻辑，正儿八经规规矩矩地设permalink的时候，其实都应该带上`/`或者文件扩展名咯？那么我开始遇到的页面变成下载文件的问题就好解释了，就是因为我设置的permalink后面没有带`/`或者扩展名。那么新的问题又来了，我的设置方式都是从别人写的东西里学来的，而且所有的博文的permalink都没有带`/`或者扩展名，为什么它们就能正常显示呢？这东西难免让我觉得有点莫名其妙。难道说Jekyll处理页面和处理博文的方式有些细微的差别，导致了这种情况？

我百思不得其解。

$$\rhd$$

[^page]: 这里所说的“页面”专指Jekyll的page类文档，相应地平常写的博文的类型是post。因为在这里直接写page难免显得文法不通，故用其中文含义替代。[^default]

[^default]: Jekyll还有一种文档类型：default。是所有其它文档类型的基础，所以应该算作父类型。

[^permalink]: [Extensionless permalinks](http://jekyllrb.com/docs/permalinks/#extensionless-permalinks){:target="_blank"}

<div id='CSS一知半解：图片置中'/>

###CSS一知半解：图片置中

我没学过网页开发，没有认真研究过各种网页技术。这里用的所有代码都是充分运用了拿来主义；不过还好脑子够用，偷过来的代码我都有认真研究过。

初建博客我就遇到一件不顺心的事情，那就是图片置中。用过Word的话都知道这是一个无论是概念还是操作都是易如反掌的事情，可是在HTML5+CSS的世界里，对于一个连`<div>`是什么的人来说还真的是抓瞎。

终于某日在研究Liquid，HTML和CSS的时候，[Stack Overflow上的一个问答](http://stackoverflow.com/questions/5804486/how-to-make-a-liquid-centered-image-with-a-caption-overlay){:target="_blank"}点醒了我。原来是这么一回事，靠。

本来呢，HTML里面有过一个标签`align: center`，但是到了HTML5的时候这个标签被淘汰了，要求用CSS来定义一个物件的位置。我的理解是，HTML5负责页面上要显示什么，而CSS负责描述每一个物件该如何呈现。所以这里面的逻辑关系就是：用HTML放一张图，然后用CSS来描述这张图的位置、大小、边框、阴影等，也就是这张图的“style”。

发明这玩意儿的人，还真的是很聪明啊。那么到底如何实现一张图片的居中显示呢？Stack Overflow问答的原文给出的答案是

    {% raw %}
    HTML:
    <div class="container">
    <img src="http://www.google.fr/images/logos/ps_logo2.png" class="picture" />
    <h3 class="caption">Image Caption</h3>
    </div>
    
    CSS:
    .container {
        position : relative;
        max-width : 364px;
        margin:0 auto;
    }
    .picture {
        border-radius:0.5em;
        box-shadow: 0px 0px 0.5em #000000;
        width:100%;
    }
    .caption {
        position:absolute;
        padding:0.25em;
        top:1em; left:0; right:0;
        color:black;
        background-color:rgba(0,0,0,0.2);
        text-align:center;
    }
    {% endraw %}

这两段代码看完，我心中一阵波涛汹涌。代码的含义很简单，可我却不知道该拿这两段代码怎么办。真的是要命了，是单独放在一个文件里，还是直接全部粘到我贴图的位置？还是说这只是一个片段，还有其它的，我不知道的基础代码，它们合在一起才会有用？一个白痴的烦恼就是这么多，唉。

答案是D，以上全部。这个东西，除了自己试试，没有更好的办法了。HTML5的部分直接写进博文的Markdown文档里就可以，而CSS的部分，有几种解决办法。[^CSS]

第一种，原样照搬的话，可以写到外部文件里，引用过来；第二种，也是原样照搬，写到页面文件的`head`里；第三种，也是我比较倾向的懒人办法，就是改写为inline格式（Google易撞墙，所以图片换成了GitHub的Logo）：

    {% raw %}
    HTML:
    <div style="position: relative; max-width: 400px; 
        margin: 0 auto;">
    <img src="/assets/github_logo.png" 
        style="border-radius: 0.5em; 
        box-shadow: 0px 0px 0.5em #000000; 
        width: 100%;"/>
    <h3 style="position: absolute; padding: 0.25em; 
        top: 1em; left: 0; right:0; 
        color: #ac4142; background-color: rgba(120,0,0,0.2);
        text-align: center;">Image Caption</h3>
    </div>
    {% endraw %}

<div style="position: relative; max-width: 400px; 
    margin: 0 auto;">
<img src="/assets/images/github-logo.png" 
    style="border-radius: 0.5em; 
    box-shadow: 0px 0px 0.5em #000000; 
    width: 100%;"/>
<h3 style="position: absolute; padding: 0.25em; 
    top: 1em; left: 0; right:0; 
    color: #ac4142; background-color: rgba(120,0,0,0.2);
    text-align: center;">Image Caption</h3>
</div>

这下足够居中了吧，混蛋！但是怎么把说明文字挪到图像的底下去呢？貌似说明文字一般都不会写在说明对象上的啊。结果是，不管我怎么调整说明文字的参数，都没有一套通行、准确的参数，使说明文字紧跟着图像出现。

最后网络搜索来救场：这个功能呢，人家是有现成的标签的：`<figure>`和`<figcaption>`。好吧，把这两个标签用到刚刚剽窃来的代码里：

    {% raw %}
    <div style="position: relative; max-width: 400px; margin: 0 auto;">
        <figure style="margin-left: 0; margin-right: 0;
            max-width: 100%;">
        <img title="I claim fair use."
            src="/assets/github_logo.png" 
            alt="I claim fair use."
            style="border: 1px solid black; margin-bottom:0;"/>
        <figcaption style="color: #ac4142;
            background-color: rgba(120,0,0,0.2);
            text-align: center;">
            GitHub</figcaption>
        </figure>
    </div>
    {% endraw %}

<div style="position: relative; max-width: 400px; margin: 0 auto;">
    <figure style="margin-left: 0; margin-right: 0;
        max-width: 100%;">
    <img title="I claim fair use."
        src="/assets/images/github-logo.png" 
        alt="I claim fair use."
        style="border: 1px solid black; margin-bottom:0;"/>
    <figcaption style="color: #ac4142;
        background-color: rgba(120,0,0,0.2);
        text-align: center;">
        GitHub</figcaption>
    </figure>
</div>

总算，是达成目标了。起码现在知道CSS的基本用法了。

$$\rhd$$

[^CSS]: 详见[CSS How-to](http://www.w3schools.com/css/css_howto.asp){:target="_blank"}。CSS可以作为外部文件，或者放在HTML的`head`中，或者做为inline表达式。

###从旧博客迁移数据

很久很久以前，有个东西叫做[Windows Live空间](https://en.wikipedia.org/wiki/Windows_Live_Spaces){:target="_blank"}。那时，一只年轻的家猫也曾经把他的各种破事写成文字，发上网去。在我的记忆中，那个时候这是一件很时髦的事情。多年以后重新开始写东西，决定把以前写的也一并转移过来。

安装Jekyll-import
解决nokogiri的编译问题
在wordpress.com导出网站的xml文档
import
手动调整，发布旧文

###添加照片、相册

搜索找到文章[Generation an Image Gallery with Jekyll and Lightbox 2](http://christianspecht.de/2014/03/08/generating-an-image-gallery-with-jekyll-and-lightbox2/){:target="_blank"}，[Lightbox](http://lokeshdhakar.com/projects/lightbox2/) by Lokesh Dhakar不错

Lightbox需要[jQuery](https://jquery.com/){:target="_blank"}，尽管提供了打包好的`lightbox-plus-jquery.js`，但是我有感觉以后会用到jQuery的地方会有很多，应该现在就安装，以后会省不少事。

官网：安装jQuery用[Bower](http://bower.io/){:target="_blank"}，安装Bower要用[node](https://nodejs.org/){:target="_blank"}，[npm](https://www.npmjs.com/){:target="_blank"}和git。其中npm包含在node的安装包里面。各种坑啊。

安装node时又出问题：官网的安装包把node装到了`/usr/local/lib`这种需要sudo的地方，是一种十分不负责任的作法。没法，手动删除了所有安装的文件，然后按照[这篇文章](http://www.johnpapa.net/how-to-use-npm-global-without-sudo-on-osx/){:target="_blank"}的说明重新来过。大坑啊。

折腾了两个小时后，我决定放弃bower，直接下载jQuery。Damn you for having me jumping through hoops for nothing, jQuery.

将Lightbox组建插入，试验了一下，感觉不够流畅。决定考察考察[Jssor Slider](http://www.jssor.com/index.html){:target="_blank"}。但是最终发现我要找的不是slider（放幻灯），而是一个既能在文章中插入显示图片（viewer），又能单独成为一个幻灯页的东西。同时，这个解决方案应该有比较良好的浏览器和设备支持（比如触控滑动翻页，lightbox就没有）。我觉得我找到了，它就是[PhotoSwipe](http://photoswipe.com/){:target="_blank"}。从介绍上来看，真的是各种优秀。还有同门小弟[Magnific Popup](http://dimsemenov.com/plugins/magnific-popup/){:target="_blank"}，也是小巧轻便美观大方，不过缺少移动设备的支持。还有另一个看着不错的是[Gamma Gallery](http://tympanus.net/Development/GammaGallery/){:target="_blank"}。

目前可以确定的是，一张图片必须有两个版本，一个缩略图，一个原图。主要还是从带宽的角度考虑的。

###学习JavaScript

PhotoSwipe看起来真的好牛B、好漂亮，但是它不是一个简单的JavaScript插件，要使用它需要一定的JavaScript基础知识。从它网站给出的实例来看，要在代码层面做的工作不少。那么如果我要将它拿来用，就必须先学会JavaScript。

###GitHub对大小写的挑剔

在整理文件结构和命名的时候，我决定需要`_include`文件夹下面的文件名统一用小写。于是把`MathJax.html`改成了`mathjax.html`，并且把`default.html`中的`include`语句也一并修改。结果，push的时候GitHub死活说我include不存在的文件。不对啊，我本地build的时候一点问题都没有呢。害我一顿找，大规模的清理了一遍，尝试各种修改，还是不行。始终就是那句话：

>The page build failed with the following error: 
>
>A file was included in `_layouts/default.html` that is a symlink or does not exist in your `_includes` directory. For more information, see https://help.github.com/articles/page-build-failed-file-is-a-symlink. 
>
>If you have any questions you can contact us by replying to this email. 

就在蛋越来越疼的时候，我在网页里打开repo，想检查一下GitHub服务器上的`_include`文件夹和我本地的文件夹到底有什么不同。结果发现，我的桌面版GitHub在push的时候根本没有检测到`MathJax.html`的文件名发生了变化：它根本没有把改成小写的文件名传上去，导致我引用的时候是小写，而文件名依然是大写。这也难怪，OS X的默认文件系统是不区分大小写的，所以桌面版的GitHub无法看到文件名的大小写发生了变化。而GitHub服务器肯定是要区分的（多半是ext4之类）。所以造成了这种局面。

我对GitHub的唯一的意见，就是错误信息不够详细，无法准确定位出问题的地方。我给support反馈了我的经历：

>Hi there,
>
>After careful examination on my local files as well as what’s been pushed to GitHub, I discovered the reason of this build failure:
>
>I’ve recently changed the name of the file `MathJax.html` into `mathjax.html` (just the name, content unchanged), as well as its reference in `default.html`. But GitHub desktop did not pickup the filename change and I did not notice. So apparently the file on GitHub server is still named `MathJax.html`. Therefore causing a build failure.
>
>My feedback is that GitHub should include a little bit more detail in the error message, like line number of the fault location. Maybe implement some checks in the desktop app to check for filename change (I know it’s unlikely), or at least mention the possibility of a situation like mine in your support article.

>Regards,
>Yifeng

###加入Build Timestamp

随便在哪加入一句

    {% raw %}
    {{ site.time | date_to_rfc822 }}
    {% endraw %}

就能记录下当前网站的Build时间，在线测试的时候很有用。
