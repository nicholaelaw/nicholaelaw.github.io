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

按照这个逻辑，正儿八经规规矩矩地设permalink的时候，其实都应该带上`/`或者文件扩展名咯？那么我开始遇到的页面变成下载文件的问题就好解释了，就是因为我设置的permalink后面没有带`/`或者扩展名。那么新的问题又来了，我设置permalink的方式都是从别人写的东西里学来的，而且所有的博文的permalink都没有带`/`或者扩展名，为什么它们就能正常显示呢？这东西难免让我觉得有点莫名其妙。难道说Jekyll处理页面和处理博文的方式有些细微的差别，导致了这种情况？

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
<img src="/assets/github_logo.png" 
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
        src="/assets/github_logo.png" 
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
