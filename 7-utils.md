---
layout: page
usemath: true
title: 参考
---

* [Disqus](http://www.disqus.com/)
* [**Google Analytics**](http://www.google.com/analytics)[^bold]
* [HTML Code Table](http://www.ascii.cl/htmlcodes.htm)
* [\\(\LaTeX\\) Mathematical Symbols](/assets/LaTeX-Mathematical-Symbols.pdf)
* [HTML Symbols, Entities, Characters, and Codes](http://http://htmlarrows.com/)
* [**w3school**](http://www.w3schools.com/)
* [JiaThis](http://www.jiathis.com/)
* [Octopress](http://octopress.org/)
* [Tags in Jekyll](http://charliepark.org/tags-in-jekyll/)
* [Center an Image CSS Tricks](https://css-tricks.com/snippets/css/absolute-center-vertical-horizontal-an-image/)
* [favicon.cc](http://www.favicon.cc/)

presentation: if there are no or two underscores inside an inline math expression, it's fine:

	\\( v_{this}+v_{that} \\)

renders to \\( v_{this}+v_{that} \\). However if there is an odd number of underscores inside an inline math expression, then it's trouble: 

	\\( v_{this} \\)

gives \\( v_{this} \\), and

	\\( v_{eeny}+v_{meeny}+v_{miny} \\)
	
gives \\( v_{eeny}+v_{meeny}+v_{miny} \\). Furthermore, it gets ugly when you use two single-underscore-inline-math in one sentence:

	\\( v_{eeny} \\) and \\( v_{meeny}+v_{miny}+v_{moe} \\)

gives \\( v_{eeny} \\) and \\( v_{meeny}+v_{miny}+v_{moe} \\).

In my experience this behaviour occurs only on GitHub rendered pages. Neither of my Markdown editor (MacDown) nor my local Jekyll installation had any problem with it.

[^bold]: 粗体表示经测试已撞墙的网站。