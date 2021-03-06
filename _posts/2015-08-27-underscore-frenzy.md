---
layout: post
permalink: an-underscored-frenzy/
comments: true
use-math: true
use-pswp: true
tags:
- computer ≌ 计算机
- bugs
- programming ≌ 编程
- tinker ≌ 折腾
- github
title: An Underscored Frenzy
---

In one episode of inspecting and messing around the blog's math, I encountered a problem that led to much confusion at first. It is caused by the very inconspicuous underscore sign `_`.

The problem arose when I was checking my blog before I went to bed one night. I am a little obsessive with _correctly_ presenting my ideas. It appears that a few maths I wrote on the blog isn't rendering correctly: instead of a beautifully rendered math expression, I got raw \\( \LaTeX \\) syntax staring at me. It feels naked.

<div style="position: relative; max-width: 600px; margin: 0 auto;">
    <figure style="margin-left: 0; margin-right: 0;
        max-width: 100%;">
    <img itemprop="image" title="This looks pretty."
        src="/assets/images/math-correct.jpg" 
        alt="This looks pretty."
        style="margin-bottom:0;"/>
    <figcaption>
            &rdsh; Correctly rendered.</figcaption>
    </figure>
</div>
    
<div style="position: relative; max-width: 600px; margin: 0 auto;">
    <figure style="margin-left: 0; margin-right: 0;
        max-width: 100%;">
    <img itemprop="image"  title="This isn't right."
        src="/assets/images/math-wrong.jpg" 
        alt="This isn't right."
        style="margin-bottom:0;"/>
    <figcaption>
            &rdsh; SOMETHING IS WRONG!!!!</figcaption>
    </figure>
</div>

I made some changes and the problem went away. So I went to sleep. The next day, through much tinkering and experimenting I found that it was a bit more than a simple mistake.

So here's my formal complaint to GitHub, on their mistreating of the underscore sign.[^bug]

[^bug]: I have filed a bug report after this post went online. If they fix the issue I will have to replace those examples with images.

<!--excerpt-->

###Background

This blog, like many other on [GitHub Pages](https://pages.github.com/), is power by [Jekyll](http://jekyllrb.com/). The posts are written in Markdown syntax, with maths in [\\( \LaTeX \\)](http://www.latex-project.org/) and rendered by [MathJax](https://www.mathjax.org/). In \\( \LaTeX \\) a subscript is indicated by the underscore sign:

	text_{sub}
	
renders as \\( text_{sub} \\). In Markdown, however, the underscore indicates emphasis:

	Eeny is a _fast_ runner.
	
is presented as "Eeny is a _fast_ runner." To prevent the document becoming FUBAR any syntax that you wish to be treated as \\( \LaTeX \\) should be enclosed in delimiters: `\\(``\\)`for inline expressions and `\\[``\\]` or `$$` for displayed math.

###The Problem

When there is a single underscore used in inline math, it is fine as long as it's the _only_ underscore in the paragraph:

	Let the velocity be \\( v_{eeny} \\). Eeny runs very fast.

renders as

> Let the velocity be \\( v_{eeny} \\). Eeny runs very fast.

If, however, an underscore in inline math is not the only one in the paragraph, the emphasis _might_ break while the math goes tits-up:

	Let the velocity be \\( v_{eeny} \\). Eeny runs _very_ fast.

renders as

> Let the velocity be \\( v_{eeny} \\). Eeny runs _very_ fast.

Another example:

	Let the _velocities_ be \\( v_{eeny} \\) and \\( v_{meeny} \\)

renders as

> Let the _velocities_ be \\( v_{eeny} \\) and \\( v_{meeny} \\).

It seems that the underscores in inline math are being treated as Markdown emphasis, even though it shouldn't be:

	Let the velocities be \\( v_{eeny} \\) and \\( v_{meeny} \\). There's also \\( v_{miny} \\) and \\( v_{moe} \\).

> Let the velocities be \\( v_{eeny} \\) and \\( v_{meeny} \\). There's also \\( v_{miny} \\) and \\( v_{moe} \\).

###The Confusing Part and Conclusion

I was at first totally clueless as to what went wrong because everything is OK before I pushed my changes to GitHub. Once published some of the inline maths would fail to render, and show up as emphasized texts. 

So after checking and experimenting back and forth I think I've found the source of the problem.

My Markdown editor [MacDown](http://macdown.uranusjr.com/) encounters this in syntax highlighting, but it renders correctly. 

<div class="imgDisplay monod" style="max-width: 600px;" itemscope itemtype="http://schema.org/ImageGallery">
  <figure style="width: 100%; margin-bottom: 1rem; float: none;" itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
    <a href="/assets/images/macdown-syntax-highlighting-wrong.jpg" itemprop="contentUrl" data-size="1267x600">
    <img style="margin-bottom: 0;" src="/assets/images/macdown-syntax-highlighting-wrong.jpg" itemprop="thumbnail" alt="Wrong emphasis, ma'am" />
    </a>
    <figcaption itemprop="caption description">Wrong emphasis, ma'am</figcaption>
    <figcaption style="display: block;">
        &rdsh; So much gold. Click the image to see the gold <i>more closely</i>.</figcaption>
    </figure>
  </figure>
</div>

My local Jekyll installation also gives me correct rendering:

<div style="position: relative; max-width: 600px; margin: 0 auto;">
    <figure style="margin-left: 0; margin-right: 0;
        max-width: 100%;">
    <img title="It's pretty until it leaves me."
        src="/assets/images/local-jekyll-render.jpg" 
        alt="It's pretty until it leaves me."
        style="margin-bottom: 0;"/>
    <figcaption>
        &rdsh; Good work, Dr. Jekyll</figcaption>
    </figure>
</div>

So it seems to me that something went wrong on GitHub's side. A simple workaround is to use displayed math delimiters `\\[``\\]` and `$$`. Normally I wouldn't do this because these are for displayed math, and in \\( \LaTeX \\) it would break the sentence if used inline. Well I guess MathJax cannot enforce that rule on webpages.

So the conclusion is that when GitHub is processing the Markdown syntax, `\\(``\\)` enclosed expressions are not properly escaped. While it is a small thing I still hope GitHub team would fix it. Like I said before, I'm a bit obsessive with this kind of things.

$$\square$$

**Update 08-28**: James at GitHub got back to me, it appears that I had omitted a few recommended steps when deploying Jekyll to GitHub Pages. In short, this is because GitHub Pages is running older sofware on their servers. Understandably, any updates on GitHub's side are subject to security review, so GitHub's packages are a few versions behind my local setup. Best hope is to wait for them to update their dependencies, it seems.
