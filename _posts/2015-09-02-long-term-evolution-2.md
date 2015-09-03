---
layout: post
permalink: long-term-evolution-2
comments: true
use-math: true
tags:
- 计算机
- computer
- 编程
- programming
- 备忘
- memo
- 折腾
- tinker
- 长期演进
- lte
title: 博客的长期演进II
---

这个系列的文章收集了平时维护博客时遇到的各种小问题、hack以及一些想法。

* [隐藏页面和Permalink]({{site.baseurl}}{{page.url}}/#隐藏页面和Permalink)
* [CSS一知半解：图片置中]({{site.baseurl}}{{page.url}}/#CSS一知半解：图片置中)
* [添加照片、相册，`node.js`的正确安装方法]({{site.baseurl}}{{page.url}}/#添加照片、相册，`node.js`的正确安装方法)
* [学习JavaScript]({{site.baseurl}}{{page.url}}/#学习JavaScript)
* [GitHub对大小写的挑剔]({{site.baseurl}}{{page.url}}/#GitHub对大小写的挑剔)
* [加入Build Timestamp]({{site.baseurl}}{{page.url}}/#加入Build Timestamp)
* [注释和PhotoSwipe的和睦相处]({{site.baseurl}}{{page.url}}/#注释和PhotoSwipe的和睦相处)
* [Responsive `iframe`]({{site.baseurl}}{{page.url}}/#Responsive `iframe`)

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
<img src="/assets/images/GitHub-Logo.png" 
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
        src="/assets/images/GitHub-Logo.png" 
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

<div id='添加照片、相册，`node.js`的正确安装方法'/>

###添加照片、相册，`node.js`的正确安装方法

搜索找到文章[Generating an Image Gallery with Jekyll and Lightbox 2](http://christianspecht.de/2014/03/08/generating-an-image-gallery-with-jekyll-and-lightbox2/){:target="_blank"}，觉得[Lightbox](http://lokeshdhakar.com/projects/lightbox2/)看着还不错。

Lightbox需要[jQuery](https://jquery.com/){:target="_blank"}，尽管提供了打包好的`lightbox-plus-jquery.js`，但是我有感觉以后会用到jQuery的地方会有很多，应该现在就安装，以后会省不少事。

官网：安装jQuery用[Bower](http://bower.io/){:target="_blank"}，安装Bower要用[node](https://nodejs.org/){:target="_blank"}，[npm](https://www.npmjs.com/){:target="_blank"}和git。其中npm包含在node的安装包里面。各种坑啊。

安装node时又出问题：官网的安装包把node装到了`/usr/local/lib`这种需要sudo的地方，是一种十分不负责任的作法。没法，手动删除了所有安装的文件，然后按照[这篇文章](http://www.johnpapa.net/how-to-use-npm-global-without-sudo-on-osx/){:target="_blank"}的说明重新来过。大坑啊。

折腾了两个小时后，我决定放弃bower，直接下载jQuery。Damn you for having me jumping through hoops for nothing, jQuery.

将Lightbox组建插入，试验了一下，感觉不够流畅。试验Lightbox花费了不少时间，所以我决定先反思一下到底要实现什么样的效果，再在现有的解决办法里筛选。

我觉得，在目前的环境下，朋友们主要都用手机上网。正儿八经的PC在一般家庭里已经越来越少；可以说在一个接入互联网的家庭里，电脑已经不再是必需品。只要有一个无线路由加一台移动设备就行了。在这种环境下网站就应该能够适应在移动终端上的显示、操作和阅读模式。如果我在网站上放一张漂亮的照片，电脑上浏览没有问题，可是在手机上看就必须上下左右地来回翻，或者说要将图片下载到手机里才能看到原图的话，那么在试图查看图片的时候读者注意力的就已经被分散了。这个逻辑，也是当下流行的概念Responsive Design的一种解释吧。

我的想法是，呈现图片的手段必须：

1. 既能以Slide（幻灯）的方式连续展示多张图片，又能居中展示一张图片；
2. 能够适应不同的终端，在电脑上展示OK，在手机、平板上展示也OK；
3. 不能太复杂，因为我又懒又蠢。

于是我继续看，[Jssor Slider](http://www.jssor.com/index.html){:target="_blank"}看着很华丽，美观。不过我要找的不是单纯的slider，所以先放一边。接着，我看到了[PhotoSwipe](http://photoswipe.com/){:target="_blank"}。从介绍上来看，我的各项要求应该都能满足，而且还支持触控操作。还有同门小弟[Magnific Popup](http://dimsemenov.com/plugins/magnific-popup/){:target="_blank"}，也是小巧轻便美观大方，不过缺少移动设备的支持。另一个看着不错的是[Gamma Gallery](http://tympanus.net/Development/GammaGallery/){:target="_blank"}，但因为此时我已经决定深入研究PhotoSwipe，所以并没有细看。

下载，解压缩，按照指引设置。可是PhotoSwipe不是单纯的JavaScript插件，拿过来就能用。PhotoSwipe更像是一个library，提供了呈现图片的必要基础而已；最后一公里也就是最终呈现照片的代码，需要自己写。我靠。

$$\rhd$$

<div id='学习JavaScript'/>

###学习JavaScript

PhotoSwipe看起来真的好牛B、好漂亮，但是要使用它需要一定的JavaScript基础知识。从它网站给出的实例来看，要在代码层面做的工作不少。那么如果我要将它拿来用，就必须先学会JavaScript。

打开[w3school](http://www.w3schools.com/){:target="_blank"}网站，从JavaScript第一章开始读。同时把PhotoSwipe官方的示例复制下来，放到我的[操场]({{site.baseurl}}{{page.url}}/playground/)上，动手。

JavaScript入门以后，虽然还不能写出完整的代码，但至少已经能够读懂别人写的代码了。这时我也成功地把官网的示例原样复制了出来。虽然只是copy-paste，但是对于对`HTML5-CSS3-JS`一窍不通的人来说，还是费了不少功夫。

$$\rhd$$

<div id='GitHub对大小写的挑剔'/>

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

$$\rhd$$

<div id='加入Build Timestamp'/>

###加入Build Timestamp

随便在哪加入一句

    {% raw %}
    {{ site.time | date_to_rfc822 }}
    {% endraw %}

就能记录下当前网站的Build时间，在线测试的时候很有用。

$$\rhd$$

<div id='注释和PhotoSwipe的和睦相处'/>

###注释和PhotoSwipe的和睦相处

貌似注释（Footnote）和PhotoSwipe的框架不是很合拍，如果一篇文章以一个slide结尾，那么第一条注释的序号会放错位置。解决办法就是在图片的容器后（容器之外）插入一个空白字符`&nbsp;`，让它单独一行，这样注释就能够正常显示了。不知道这是Jekyll在parse注释时的问题，还是PhotoSwipe容器与序号列表`li`的问题。

$$\rhd$$

<div id='Responsive `iframe`'/>

###Responsive `iframe`

在导入旧博文的时候，遇到有一篇游记嵌入了一个古早版本的地图。当时应该还没有Bing Maps，可是嵌入的图片上却有Live的标记；不知道是什么情况。抱着原样复制的想法，我去找了同一个地点的Bing Maps，以及Google Maps。嵌入后却发现地图模块的大小并不受容器控制，而且嵌入地图用的`iframe`并不接受`style="..."`这样的inline CSS。我的反应是，这是什么鬼东西！

还好，对付`iframe`这种老古董，早已有人给出了解决办法。[Making Embedded Content Work In Responsive Design](http://www.smashingmagazine.com/2014/02/making-embedded-content-work-in-responsive-design/){:target="_blank"}这篇文章里清晰地描述了如何通过（非inline）CSS来调整`iframe`的大小。也就是说，让它变得Responsive。

具体的代码文章中写的很清楚，我就不窃取过来了。大概的原理就是给包含`iframe`的`<div>`容器加上CSS，再给`<div>`容器中的`iframe`也加上CSS。也就是说要定义`.videoContainer` class和`.videoContainer iframe`的CSS。这样它就服服帖帖地任你改变大小了。

遗憾的是，我发现嵌入式的地图不太靠谱，容易误触导致原本设定好显示的区域直接无踪影。解过我最后在Google地图上截了一张图了事。

$$\square$$
