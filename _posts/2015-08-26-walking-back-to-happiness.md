---
layout: post
usemath: true
comments: true
categories: problem solution
title: 一个走路的问题
---
##原题
来自[Shakuntala Devi](https://en.wikipedia.org/wiki/Shakuntala_Devi)编写的[*Puzzels to Puzzle You*](https://books.google.com/books?id=F-idu9oxkdgC&printsec=frontcover#v=onepage&q&f=false)一书，第23问"Walking back to Happiness"：

> A man I know, who lives in my neighborhood, travels to Chinsura everyday for his work. His wife drives him over to Howrah Station every morning and in the evening exactly at 6 p.m. she picks him up from the station and takes him home.
> 
> One day he was let off at work an hour earlier, and so he arrived at the Howrah Station at 5 p.m. instead of at 6 p.m. He started walking home. However he met his wife enroute to the stationand got into the car. They drove home arriving 10 minutes earlier than usual.
> 
> How long did the man have to walk, before he was picked up by his wife?

这道题在网上有许多版本，只是地名被换成了其它的名字。作者Devi老太是印度人，所以很自然地她的版本里的Chinsura和Howrah都是印度地名。背景不多说，勉强把题翻译成中文：

> 有个男滴，住在双流，在郫县上班。每天早上他老婆开车送他到郫县的高铁站（有高铁还开什么车，你可能会问，他脑子不好使呗），然后晚上六点钟准时到高铁站接他回家（多和谐的家庭！）。
> 
> 有一天，介个男滴早了一个小时下班（老板不在？），他五点钟就到了高铁站。于是他二话不说（！）闷头就开始步行回家。走着走着，正好遇上从家里出发过来接他的老婆，于是就上了车，回了家。到家一看表，哎呀妈呀，比平常早了整整10分钟到家！
> 
> 问，介个男滴他走了好久才遇到他老婆？

抛开他为什么要走路而不是坐高铁、公交回家这种理智的问题不谈，这道题本身还真的有点意思。

##解

**友情提示：以下内容包含数学！阅读时请遵守国家相关法规**

设此男家到火车站的距离为$$d$$，男人走路的时间为$$x$$，男人步行速度为$$v_{man}$$，老婆开车速度为$$v_{car}$$。正常情况下夫妻俩从高铁站出发返家，耗时

$$\begin{equation}
	t_{home}=\frac{d}{v_{car}}
\end{equation}$$

对于老婆来说，平时接老公（从家里出发那一刻起）用时

$$\begin{equation}
	t_{wife}=\frac{2d}{v_{car}}
\end{equation}$$

今天老公走了一段路，所以到家的时间提前了10分钟：

$$\begin{equation}
	t'_{wife}=2\cdot\frac{d-v_{man}\cdot x}{v_{car}}=t_{wife}-10
\end{equation}$$

代入$$(2)$$运算，得出

$$\begin{equation}
	\frac{v_{man}}{v_{car}}\cdot x=5
\end{equation}$$

但是对男人来说，今天五点钟就出发了，回家所用的时间是

$$\begin{equation}
	t'=x+\frac{d-v_{man}\cdot x}{v_{car}}=t_{home}+60-10
\end{equation}$$

代入$$(1)$$，计算得出

$$\begin{aligned}
	x+\frac{d}{v_{car}}-\frac{v_{man}}{v_{car}}\cdot x &=\frac{d}{v_{car}}+50\\
	x--\frac{v_{man}}{v_{car}}\cdot x &=50
\end{aligned}$$

将$$(4)$$代入到上述结果中，得出$$x=55$$。即男人走了55分钟（略凄凉）。

$$\square$$

##吐槽

最开始我解到$$(4)$$就解不动了。心想这未知数怎么都比公式多，怎么可能解得出答案来。在网上搜了一圈，没看到有人把解题过程发出来的。倒是有个哥们在YouTube上放了个讲解的视频。可是，哥们英语太烂能听懂的词用一只手就能数出来……最后他给了个答案，55分钟。

这可怎么办，知其然而不知其所以然是最要命的。我只有一使劲——就有了上面的东西了。今后有空我还会把平时解过的一些有意思的题目发出来。拜。