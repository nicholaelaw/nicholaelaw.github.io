---
layout: post
title: 博客诞生记
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

	$gem install jekyll
	ERROR:  While executing gem (Gem::RemoteFetcher::FetchError)
	Errno::ECONNRESET: Connection reset by peer - SSL_connect (https://api.rubygems.org/blah)
	
尼玛这是在跟我开玩笑吗？！[Ruby Gems](https://rubygems.org/)居然被墙了？无奈，先翻墙再说。

（懒得翻墙的，可以让`gem`转向[国内镜像源](http://ruby.taobao.org/)下载。）

###墙墙墙！

`gem`命令不支持我平时科学上网用的socks代理，所以要想办法将`gem`命令的http请求转发到socks代理上。到网上搜了一圈，有人说用[Polipo](http://www.pps.univ-paris-diderot.fr/~jch/software/polipo/);然而我安装之后折腾半天居然不会用……又要被人耻笑了。

继而看到有人说[Privoxy](http://www.privoxy.org/)，于是`brew`安装上。在`/usr/local/etc/privoxy/config`文件中加一句配置：

	forward-socks5 / 127.0.0.1:1080 .
	
注意最后那个点很重要。`/`代表所有http地址都要转发，`.`代表没有要转发的http代理（只有socks）。写好配置，发动

	$privoxy /usr/local/etc/privoxy/config
	-bash: privoxy: command not found

这……说明`brew`没有做symlink。爬进`/usr/local/`，终于找到在`/usr/local/etc/privoxy/`下面。再次发动。

###再一次，Jekyll

Privoxy的默认http代理端口是8118：

	$gem install jekyll -p http://127.0.0.1:8118
	
终于，没有再报错了。

##施工

到这里算是基本准备工作结束了。我已经抽掉了半包烟了，各种疲惫不堪。

###Poole, Lanyo

下载已经预制好的[Lanyon](http://lanyon.getpoole.com/)主题，解压到打算作为repo的目录下，先不着急修改，`cd`到根目录下运行

	$jekyll serve
	
然后在浏览器里访问`127.0.0.1:4000`，看看刚刚建起来的网站雏形，和Lanyon的官方页面一模一样。接下来修改各种模板参数。

####`/_config.yml`
这里`Setup`部分修改`title`（标题），`tagline`（副标题），`description`（描述）和`url`（链接地址）。`baseurl`为空。



###添加[Google Analytics](http://www.google.com/analytics)

###添加[Disqus](http://www.disqus.com)评论
将Disqus的Universal代码复制到`/_include/comments.html`文件里：

	{% raw %}
	{% if page.comments %}
	<!-- Add Disqus comments. -->
	
	<--- 代码粘到这里 --->
	
	{% endif %}
	{% endraw %}

然后在`/_layouts/default.html`中的`{% raw %}{{ content }}{% endraw %}`这句后面加入

	{% raw %}{% include comments.html %}{% endraw %}
	
就大功告成了。之后就可以在FrontMatter里面用`comments:true`来开关评论了！


##注意事项

* 直接将User Page（也就是username.github.io）作为博客空间时`baseurl`必须为空。同要修改根目录的`index.html`文件，找到

	```
	{% raw %}<a href="{{ site.baseurl }}/{{ post.url }}">{% endraw %}
	```
		
  这一行，把中间那个`/`去掉。否则的话首页上的Permalink会变得千奇百怪。