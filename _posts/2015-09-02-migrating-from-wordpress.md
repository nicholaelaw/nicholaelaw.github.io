---
layout: post
permalink: migrating-from-wordpress
comments: true
use-math: true
tags:
- wordpress
- jekyll
- 博客
- blog
- 折腾
- tinker
title: 从Wordpress迁移到Jekyll
---

很久很久以前，有个东西叫做[Windows Live空间](https://en.wikipedia.org/wiki/Windows_Live_Spaces){:target="_blank"}。那时，一只年轻的家猫也曾经把他的各种破事写成文字，发上网去。在我的记忆中，那个时候这是一件很时髦的事情。多年以后重新开始写东西，决定把以前写的也一并转移过来。

* [安装`jekyll-import`]({{site.baseurl}}{{page.url}}/#安装`jekyll-import`)
* [导出Wordpress的XML数据，整理，发布]({{site.baseurl}}{{page.url}}/#导出Wordpress的XML数据，整理，发布)

<!--excerpt-->

<div id="安装`jekyll-import`"/>

###安装`jekyll-import`

这一步很简单，按照[`jekyll-import`](http://import.jekyllrb.com/docs/installation/){:target="_blank"}，命令行输入

    $ gem install jekyll-import
    
开始安装。结果提示我找不到什么`libiconv`。仔细一看，是在编译一个叫做`nokogiri`的包的时候出错的。于是搜索，最终在`nokogiri`的[官方文档](http://www.nokogiri.org/tutorials/installing_nokogiri.html){:target="_blank"}里，在Mac OS X的安装指引下提到了`libiconv`出错的解决办法，其根源在于`Xcode Commandline Tool`的版本不对。按照文中的解决办法操作，成功安装`jekyll-import`。

<div id='导出Wordpress的XML数据，整理，发布'/>

###导出Wordpress的XML数据，整理，发布

我的旧博客是放在[WordPress.com](https://wordpress.com/){:target="_blank"}上面的，所以直接按照`jekyll-import`指引中对应WordPress.com的方法，就可以轻松导出在WordPress上的数据。

导出了XML文档后，使用命令

    $ ruby -rubygems -e 'require "jekyll-import";
    JekyllImport::Importers::WordpressDotCom.run({
      "source" => "wordpress.xml",
      "no_fetch_images" => false,
      "assets_folder" => "assets"
    })'

导入刚刚抓出来的XML文档。这个过程会给每一条旧博文生成一个`html`文档，并且下载所有博文中引用过的图片。这个过程完事之后，就需要手动整理每一篇文章，然后重新发布到新的博客中去[^old-posts]。

[^old-posts]: 我是这么操作的。但是理论上说，把这些`html`文档直接copy到Jekyll的`_posts`目录下也未尝不可。

这是一个漫长的过程。旧博客上总共有69篇文章，除去各种偷懒转发的东西，总共有49篇，我自己都吓了一跳。这其中有各种哀怨的小短篇，也有几篇以前出游发的游记+照片，还有以前DIY电脑时留下的遗迹。每一篇我都重新读过，整理过后以Markdown文档发布。

这其中最费力的就是照片了。既然已经在研究[PhotoSwipe](http://photoswipe.com/){:target="_blank"}的植入，把旧博文里的照片以当下最先进的方式重新展现出来，应是最好的实践了。

这个枯燥的过程我就不详细描述了。我用了整整三天时间，把每一篇旧博文一一编辑整理，每张还能找到原图的照片重新制作缩略图，然后发布出来。那感觉就像是时光机，看到自己七八年前的时候写的那些东西，感触颇深啊[^feel]。

[^feel]: 感触就是，我果然是一个奇怪的小孩。现在看来，当时写的文字还真是文艺。不知是文艺本身就是青春的副产物，还是随着年龄的增长我已不可避免地变得俗气了。

那么，就这样吧。The past is what makes us who we are now, and the present lets us choose who we will be in the future.
