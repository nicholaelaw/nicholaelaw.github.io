---
layout: post
permalink: an-underscored-frenzy
comments: true
usemath: true
tags:
 - bugs
 - tinker
 - github
title: An Underscored Frenzy
---

In one episode of inspecting and messing around the blog's math, I encountered a problem that led to much confusion at first. It is caused by the very inconspicuous underscore sign `_`.

The problem arose when I was checking my blog before I went to bed one night. I am a little obsessive with _correctly_ presenting my ideas. It appears that a few maths I wrote on the blog isn't rendering correctly: instead of a beautifully rendered math expression, I got raw \\( \LaTeX \\) syntax staring at me. It feels naked.

Correct:

<img title="Math Done Right"
    src="/assets/math-correct.jpg"
    style="width:600px; height:116px;"
    border="0" alt="Math done right" />
    
Incorrect:

<img title="Math Done Wrong"
    src="/assets/math-wrong.jpg"
    style="width:600px; height:116px;"
    border="0" alt="Math done wrong" />

I made some changes and the problem went away. So I went to sleep. The next day, through much tinkering and experimenting I found that it was a bit more than a simple mistake.

So here's my formal complaint to GitHub, on their mistreating of the underscore sign.

###Background

This blog, like many other on [GitHub Pages](https://pages.github.com/), is power by [Jekyll](http://jekyllrb.com/). The posts are written in Markdown syntax, with maths in [\\( \LaTeX \\)](http://www.latex-project.org/) and rendered by [MathJax](https://www.mathjax.org/). In \\( \LaTeX \\) a subscript is indicated by the underscore sign:

	text_{sub}
	
renders as \\( text_{sub} \\). In Markdown, however, the underscore indicates emphasis:

	Eeny is a _fast_ runner.
	
is presented as "Eeny is a _fast_ runner." To prevent the document becoming FUBAR any syntax that you wish to be treated as \\( \LaTeX \\) should be enclosed in delimiters: `\\(``\\)`for inline expressions and `\\[``\\]` or `$$` for displayed math.

###The Problem

When there's only a single inline math with a single underscore in the entire paragraph, it's fine:

	Let the velocity be \\( v_{eeny} \\). Eeny runs _very_ fast.

renders as

> Let the velocity be \\( v_{eeny} \\). Eeny runs _very_ fast.

Both the math and the emphasis works. If, however, there's multiple inline maths with underscore in the paragraph, the math breaks:

	Let the velocities be \\( v_{eeny} \\) and \\( v_{meeny} \\)

renders as

> Let the velocities be \\( v_{eeny} \\) and \\( v_{meeny} \\).

It seems that the underscores in inline math are being treated as Markdown emphasis, even though it shouldn't be:

	Let the velocities be \\( v_{eeny} \\) and \\( v_{meeny} \\). There's also \\( v_{miny} \\) and \\( v_{moe} \\).

> Let the velocities be \\( v_{eeny} \\) and \\( v_{meeny} \\). There's also \\( v_{miny} \\) and \\( v_{moe} \\).

###The Confusing Part and Conclusion

I was at first totally clueless as to what went wrong because everything is OK before I pushed my changes to GitHub. Once published some of the inline maths would fail to render, and show up as emphasized texts. 

So after checking and experimenting back and forth I think I've found the source of the problem.

My Markdown editor [MacDown](http://macdown.uranusjr.com/) encounters this in syntax highlighting, but it renders correctly. 

<a href="/assets/macdown-syntax-highlighting-wrong.jpg">
<img title="MacDown Screenshot"
    src="/assets/macdown-syntax-highlighting-wrong.jpg"
    style="width:600px; height:284px;"
    border="0" alt="Wrong emphasis, ma'am" />
</a>

My local Jekyll installation also gives me correct rendering. So it seems to me that something went wrong on GitHub's side. A simple workaround is to use displayed math delimiters `\\[``\\]` and `$$`. Normally I wouldn't do this because these are for displayed math, and in \\( \LaTeX \\) it would break the sentence if used inline. Well I guess MathJax cannot enforce that rule on webpages.


So the conclusion is that when GitHub is processing the Markdown syntax, `\\(``\\)` enclosed expressions are not properly escaped. While it is a small thing I still hope GitHub team would fix it. Like I said before, I'm a bit obsessive with this kind of things.