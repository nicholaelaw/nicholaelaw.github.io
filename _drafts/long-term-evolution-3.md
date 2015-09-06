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

<!--excerpt-->

<div id="Better Related Posts, without Plugin" ></div>

### Better Related Posts, without Plugin

随着博客的文章慢慢多了起来，我发现每篇文章末尾那个Related Posts（类似文章）其实并不是特别地与主题相关，而且偶尔还能看到完全不相关的文章。上网逛逛，看看其他人有神马想法。

由于GitHub Pages支持的Jekyll插件很有限，所以能尽量不用插件的地方就不用。因为就算找到能解决问题的插件，也很可能因为GitHub Pages不支持而无法使用。于是我找啊找，很快就找到了一个上海交大的姑娘写的一篇文章，[Jekyll Related Posts without Plugin](http://zhangwenli.com/blog/2014/07/15/jekyll-related-posts-without-plugin/){:target="_blank"}。

她一开始用了别人写的一个插件，结果push到GitHub后发现插件不起作用。调查后发现GitHub Pages并不支持她用的那个插件。于是这个姑娘心一横，自己动手用`liquid`写了一段逻辑判断，实现了跟插件一样的效果。

不过我并没有用她的代码。不是因为代码有问题，我读过也试过了，代码没有问题。问题在于判断related posts的关键在与寻找拥有相同tag（标签）数量较多的文章。而我的博客上，很多旧博文根本就没有设标签，所以再怎么寻找也是没有。所以只有先放一下，把标签完善了，再来偷代码。

$$\rhd$$

<div id="Regex!" ></div>

### Regex!

研究了一天一夜，终于搞定了用Sublime Text的snippet来简化写文时插入代码的过程。在我不懈的努力下，终于搞出了能够正确抓取文本的regex！

$$\rhd$$

* [重新学习使用Sublime Text]({{site.baseurl}}{{page.url}}/#重新学习使用Sublime Text)

<div id="重新学习使用Sublime Text" ></div>

### 重新学习使用Sublime Text


