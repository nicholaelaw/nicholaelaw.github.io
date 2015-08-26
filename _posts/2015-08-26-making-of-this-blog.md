---
layout: post
permalink: making-of-this-blog
comments: true
usemath: true
tags:
 - computer
 - programming
 - memo
 - tinker
title: 博客是怎样炼成的
---

##前言

本人比较懒，行动力也比较差。所以很多时候有些想法却迟迟不能去做，为此深感自责。渐渐地，我变成了自己不喜欢的那种人。

平时会时不时地写一些东西，比如解题的过程，比如和猫咪互动的随感。非常琐碎但是自己又很珍惜，总想找个地方存起来。受到Randall Munroe的[What if?](http://whatif.xkcd.com)站点风格的影响，决定弄个博客。博客弄出来了，第一篇文章记下建站的过程，是再合适不过的了。[^note]

<!--excerpt-->

[^note]: 其实我写文章闷大过于骚（至少，我天真地以为），时常在组织语言时纠结很久。

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

`gem`命令不支持我平时科学上网用的socks代理，所以要想办法将`gem`命令的http请求转发到socks代理上。到网上搜了一圈，有人说用[Polipo](http://www.pps.univ-paris-diderot.fr/~jch/software/polipo/)；然而我安装之后折腾半天居然不会用……又要被人耻笑了。

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

###主体工程
下载已经预制好的[Lanyon](http://lanyon.getpoole.com/)主题，解压到打算作为repo的目录下，先不着急修改，`cd`到根目录下运行

	$ jekyll serve
	
然后在浏览器里访问`127.0.0.1:4000`，看看刚刚建起来的网站雏形，和Lanyon的官方页面一模一样。接下来修改各种模板参数。

####**`/_config.yml`**

两个小坑：

* `url` 博客地址，以`https`开头，结尾不要有`/`。
* `baseurl` 因为是直接建在User Page，所以为空[^burl]。如果不是，设为project名。

####**`/_layouts/default.html`**

首先选择一个主题。在Lanyon的官方页面里介绍了Lanyon预置的各种配色以及可选的边栏布局，我直接全选了：

	{% raw %}
	<body class="theme-base-08 layout-reverse sidebar-overlay">
	{% endraw %}
	
先加这么一句，一会儿还要回来。

####**`/_includes/head.html`**

这相当于一个header文件，如果要让一句代码在所有页面上都出现，就把它加到这里（或者单独建个html然后在`default.html`里`include`，一会儿就有）。我打算要在博客文章里写不少数学方面的东西，所以需要一个能清晰无损的呈现方式（OK, I don't *need* it, I **want** it）。从[What if?](http://whatif.xkcd.com)的的页面
以及在xkcd论坛[求助](http://forums.xkcd.com/viewtopic.php?f=2&t=112510)中得知Randall使用了[MathJax](https://www.mathjax.org/)。摸到其主页上一看，还真是一枚神器:

$$f(a)=\frac{1}{2\pi i}\oint_{\gamma}{\frac{f(z)}{z-a}}\mathrm{d}z$$

我几乎要忍不住大笑。实际安装很简单，将MathJax的脚本复制粘贴下来，就算完工了：

	{% raw %}
	<!-- Mathjax CDN -->
	<script type="text/javascript"
	src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
	</script>
	{% endraw %}
	
值得注意的是，上面实际上是远程调用了储存在MathJax服务器上的JS脚本，所以有时加载页面的速度会受到影响。同时考虑到国内网络的各种不稳定因素，所以也可以在本地安装MathJax，具体操作官网上有。[^math]

####**`/_includes/sidebar.html`**

干掉各种多余的什么Download、GitHub这些项目，然后把`Home`改成“首页”。

##配套

目前首页和即本页面风格已经定下来了，接下来要完善一下配套的页面。除了主页我还另外做了3个页面：目录、关于和隔壁（也就是收藏的一些网站的链接和介绍）。只要在Front Matter[^frontmatter]里面注明`layout: page`，Jekyll在生成网站的时候就会自动将文档加入到边栏里去。

这里我稍微做了点手脚，因为边栏项目除了首页是永远置顶之外，其它页面的排序都是按照各自文件名的字母排序来的。如果放任不管，就会造成目录（Archive）排在关于（About）之后，不太符合惯例。所以我在文件名前面加上了数字：

文件名           |页面名|
----------------|-----|
`2-archive.md`  |目录  |
`8-links.md`    |隔壁  |
`9-about.md`    |关于  |

酱~妈妈再也不用担心我的边栏项目顺序乱了。

至于这些东西里面写什么，页面都在那，去看看就知道了。

到这里，这个小博客就算是建好了。接下来是Deploy。

##上传到GitHub

###最原始的办法

那就是命令行，进入根目录，然后

	$ git add --all
	$ git commit -m "Initial commit"
	$ git push -u origin master

###懒人的办法

`git`做了十几次之后终于厌烦了，下载[GitHub for Mac](https://central.github.com/mac/latest)，加入本地repo，commit后push就行了。操作没什么难度，第一次用时还有教学，相当给力。

##评论、数据统计

本来说这些玩意儿以后再说，不过看到人家都有了写好的教学，干脆就一次性解决了吧。

###添加[Google Analytics](http://www.google.com/analytics)

废话不多说，注册Google Analytics之后把tracking code保存到`/_includes/googleAnalytics.html`，然后在`default.html`里面加一句`include`就可以了。

不过就我这个小小站的访问量，估计tracking有和没有其实区别不大：来访的人数两只手数绰绰有余了。所以这玩意儿仅仅是个bling。

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
	
就大功告成了。之后就可以在Front Matter里面用`comments: true`来开关评论了！

##感想

从开始折腾到本文收尾，烟抽了一整包，澡也没洗觉也没睡，满脸油光外面还冷飕飕地吹着风。昨晚没有下楼喂猫，不知道那货会不会今天直接不让我回家。

不过做成一件事，而且学到一些东西的感觉是满足的（饥肠辘辘的满足感）。哎不多说了我先去洗个澡觅点食……

##Todo

* 本地化：<del>Disqus、Google Analytics都是歪果仁的东西，国内用户少，而且有被墙的风险。考虑加入国内的什么微博微信之类的评论、分享服务。</del>基本完成，用[JiaThis](http://www.jiathis.com/)。

* 移动发文：<del>Jekyll虽好，但是一个重大的问题就是依赖于ruby，需要提前build。而手机平板这类东西一般没有现成的ruby开发环境，所以在移动设备或者被人的电脑上发布文章可能会让人非常头疼。有点前景的就是Cloud IDE，也就是说写好了东西在云端编译然后直接发布到GitHub上。不过Cloud IDE有各种限制，可能还有收费、被墙的烦恼。所以，有待研究。</del>GitHub Pages自带Jekyll编译，用手机发文只需commit/push至GitHub即可。

* 分类，标签，方便查找。

##注释
[^frontmatter]: Front Matter: 每个实际有内容的文档（也就是自己写的东西）开头用横线隔出来的一段参数。定义了这篇文档的性质和可选的参数（page/post或者其它什么鬼，标题是咩，以及各种自定义的开关）。
[^math]: 为了节约客户端资源，提高网页加载速度，我把MathJax的语句也单独拿出来存为一个文件，然后用和开关评论模块一样的方式，在需要的时候才加载。如果以后发现国内加载太慢的话，可能还会考虑在本地安装。
[^comments]: 对于适用于国内的评论、分享机制，还在研究中。
[^burl]: 直接将User Page（也就是username.github.io）作为博客空间时`baseurl`必须为空。同时要修改根目录的`index.html`文件，找到`{% raw %}<a href="{{ site.baseurl }}/{{ post.url }}">{% endraw %}`这一行，把中间那个`/`去掉。否则的话首页上的Permalink会废掉。