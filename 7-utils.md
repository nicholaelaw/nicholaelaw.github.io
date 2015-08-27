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

Problem presentation: if only a single underscore is used in inline math expressions in the paragraph, it's fine:

	Let the velocity be \\( v_{eeny} \\).

renders as

> Let the velocity be \\( v_{this} \\).

If, however, there's multiple underscores in the paragraph, the math breaks:

	Let the velocities be \\( v_{eeny} \\) and \\( v_{meeny} \\)

renders as

> Let the velocities be \\( v_{eeny} \\) and \\( v_{meeny} \\).

It seems that the underscores are being treated as Markdown Highlight marks. However it only recognize the first two underscores in the paragraph, and the rest is left untouched and un-rendered:

> Let the velocities _be_ \\( v_{eeny} \\) and \\( v_{meeny} \\). There's also \\( v_{miny} \\) and \\( v_{moe} \\).


In my experience this behaviour occurs only on GitHub rendered pages. Neither of my Markdown editor (MacDown) nor my local Jekyll installation had any problem with it.

[^bold]: 粗体表示经测试已撞墙的网站。