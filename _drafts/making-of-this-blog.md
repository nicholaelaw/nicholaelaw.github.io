---
layout: post
title: 博客诞生记
math: true
comments: true
---

##前言

本人比较懒，行动力也比较差。所以很多时候有些想法却迟迟不能去做，为此深感自责。渐渐地，我变成了自己不喜欢的那种人。

平时会时不时地写一些东西，比如解题的过程，比如和猫咪互动的随感。非常琐碎但是自己又很珍惜，总想找个地方存起来。受到Randall Munroe的[What if?](http://whatif.xkcd.com)站点风格的影响，决定弄个博客。

##准备工作

第一步是选方案。以前玩日志、写博客的时候，基本都是小打小闹。QQ空间之流已然无法入眼。Wordpress给我的印象不是太好，可能是当初没弄透彻便放弃的缘故。之后就是买空间自己建站；但是太复杂可能又会半途而废。最后在网上搜索的时候看到有人推荐利用[GitHub Pages](https://pages.github.com/)的服务来写博客。空间不花钱而且以后很容易加上自己的域名。

看上了GitHub，当然就要自己建站了。我接触到的第一位网友推荐用[Pelican](http://blog.getpelican.com/)。不过因为对此一窍不通，我研究了许久也没搞懂怎么做。于是转向名气很大的[Jekyll](http://jekyllrb.com)。[这个博客](http://joshualande.com/jekyll-github-pages-poole/)让我眼前一亮：干净，极简的设计风格，而且貌似可以较大程度地定制。

###Jekyll

那就开干吧。我的目标是以[Poole](http://getpoole.com/)的[Lanyon](http://lanyon.getpoole.com/)主题为基础，稍加修改后作为模板使用。我懒嘛，什么评论什么统计都是二期三期的项目了。首先安装Jekyll。注意，是在本地安装！在本地建设完成调试好了之后上传就好了。所以

	$ gem install jekyll
	ERROR:  While executing gem (Gem::RemoteFetcher::FetchError)
	Errno::ECONNRESET: Connection reset by peer - SSL_connect (https://api.rubygems.org/blah)
	
尼玛这是在跟我开玩笑吗？！[Ruby Gems](https://rubygems.org/)居然被墙了？无奈，先翻墙再说。

（懒得翻墙的，可以让`gem`转向[国内镜像源](http://ruby.taobao.org/)下载。）

###墙墙墙！

`gem`命令不支持我平时科学上网用的socks代理，所以要想办法将`gem`命令的http请求转发到socks代理上。到网上搜了一圈，有人说用[Polipo](http://www.pps.univ-paris-diderot.fr/~jch/software/polipo/);然而我安装之后折腾半天居然不会用……又要被人耻笑了。

继而看到有人说[Privoxy](http://www.privoxy.org/)，于是`brew`安装上。在`/usr/local/etc/privoxy/config`文件中加一句配置：

	forward-socks5 / 127.0.0.1:1080 .
	
注意最后那个点很重要。`/`代表所有http地址都要转发，`.`代表没有要转发的http代理（只有socks）。写好配置，发动

	$ privoxy /usr/local/etc/privoxy/config
	-bash: privoxy: command not found

这……说明`brew`没有做symlink。爬进`/usr/local/`，终于找到在`/usr/local/etc/privoxy/`下面。再次发动。

###再一次，Jekyll

Privoxy的默认http代理端口是8118：

	$ gem install jekyll -p http://127.0.0.1:8118
	
终于，没有再报错了。

##施工

到这里算是基本准备工作结束了。我已经抽掉了半包烟了，各种疲惫不堪。

###Poole, Lanyo

下载已经预制好的[Lanyon](http://lanyon.getpoole.com/)主题，解压到打算作为repo的目录下，先不着急修改，`cd`到根目录下运行

	$ jekyll serve
	
然后在浏览器里访问`127.0.0.1:4000`，看看刚刚建起来的网站雏形，和Lanyon的官方页面一模一样。接下来修改各种模板参数。

####**`/_config.yml`**

`Setup`部分

* `title` 博客标题。
* `tagline` 博客副标题。
* `description` 简介。
* `url` 博客地址，以`https`开头，结尾不要有`/`。
* `baseurl` 因为是直接建在User Page，所以为空。

`About/Contact`看着办。

####**`/_layouts/default.html`**

首先选择一个主题。在Lanyon的官方页面里介绍了Lanyon预置的各种配色以及可选的边栏布局，我直接全选了：

	<% raw %><body class="theme-base-08 layout-reverse sidebar-overlay"><% endraw %>
	
先加这么一句，一会儿还要回来。

####**`/_includes/head.html`**

这相当于一个header文件，如果要让一句代码在所有页面上都出现，就把它加到这里（或者单独建个html然后在`default.html`里`include`，一会儿就有）。我打算要在博客文章里写不少数学方面的东西，所以需要一个能清晰无损的呈现方式（OK, I don't *need* it, I **want** it）。从[What if?](http://whatif.xkcd.com)的的页面
以及在xkcd论坛[求助](http://forums.xkcd.com/viewtopic.php?f=2&t=112510)中得知Randall使用了[MathJax](https://www.mathjax.org/)。摸到其主页上一看，还真是一枚神器:

$$f(a)=\frac{1}{2\pi i}\oint_{\gamma}{\frac{f(z)}{z-a}}\mathrm{d}z$$

我几乎要忍不住大笑。实际安装很简单，将MathJax的脚本复制粘贴下来，就算完工了：

	<% raw %>
	<!-- Mathjax CDN -->
	<script type="text/javascript"
	src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
	</script>
	<% endraw %>
	
值得注意的是，上面实际上是远程调用了储存在MathJax服务器上的JS脚本，所以有时加载页面的速度会受到影响。同时考虑到国内网络的各种不稳定因素，所以也可以在本地安装MathJax，具体操作官网上有。[^math]

####**`/_includes/sidebar.html`**


###添加[Google Analytics](http://www.google.com/analytics)

###添加[Disqus](http://www.disqus.com)评论[^comments]
将Disqus的Universal代码复制到`/_include/comments.html`文件里：

	{% raw %}
	{% if page.comments %}
	<!-- Add Disqus comments. -->
	
	<!-- 代码粘到这里 -->
	
	{% endif %}
	{% endraw %}

然后在`/_layouts/default.html`中的`{% raw %}{{ content }}{% endraw %}`这句后面加入

	{% raw %}{% include comments.html %}{% endraw %}
	
就大功告成了。之后就可以在FrontMatter里面用`comments:true`来开关评论了！


##注意事项

* 直接将User Page（也就是username.github.io）作为博客空间时`baseurl`必须为空。同时要修改根目录的`index.html`文件，找到

	```
	{% raw %}<a href="{{ site.baseurl }}/{{ post.url }}">{% endraw %}
	```
		
  这一行，把中间那个`/`去掉。否则的话首页上的Permalink会废掉。


##注释
[^math]: 为了节约客户端资源，提高网页加载速度，我把MathJax的语句也单独拿出来存为一个文件，然后用和开关评论模块一样的方式，在需要的时候才加载。如果以后发现国内加载太慢的话，可能还会考虑在本地安装。
[^comments]: 对于适用于国内的评论、分享机制，还在研究中。