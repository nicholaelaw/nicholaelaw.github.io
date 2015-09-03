---
layout: post
permalink: Saturday-Endeavour
comments: true
use-pswp: true
date: 2011-02-22 13:34:26.000000000 +08:00
categories:
- Computer Stuff
- Logs
tags:
- Boost
- C++
- Debian
- MPI
- 编程
- Programming
- 折腾
- tinker
- 计算机
- computer
- QuantLib
- SVN
- Visual Studio
title: Saturday Endeavour
---

<div class="imgDisplay monod" style="max-width: 600px;" itemscope itemtype="http://schema.org/ImageGallery">
  <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
    <a href="/assets/old/0220-console-997x554.png" itemprop="contentUrl" data-size="997x554" >
    <img src="/assets/old/0220-console-997x554.png" itemprop="thumbnail" 
      title="Uh-oh, I miss-typed the <code>./</code>" 
      alt="Uh-oh, I miss-typed the <code>./</code>" />
    </a>
    <figcaption itemprop="caption description">Uh-oh, I miss-typed the <code>./</code></figcaption>
  </figure>
</div>

Following previous mess-around with Mac OS X on a virtual machine, today I started the one thing that I’m still not sure can be done: put Debian on a VM.

It is perfectly feasible to put Debian on a VM, so why would I say otherwise? For starters, it has been a royal pain in the rear for me to get VMware tools installed on Linux. Yeah, all you linux gurus can laugh at my inferior intelligence and Windows-bred user experience-expectations.

Anyway, several command lines later, I almost got it working. Then I did what I always do on a freshly installed system: mess around!

* [Discovering RQuantLib]({{site.baseurl}}{{page.url}}/#Discovering RQuantLib)
* [Discovering QuantLib]({{site.baseurl}}{{page.url}}/#Discovering QuantLib)
* [Discovering Boost C++ Library]({{site.baseurl}}{{page.url}}/#Discovering Boost C++ Library)
* [Getting Boost C++ to Work]({{site.baseurl}}{{page.url}}/#Getting Boost C++ to Work)
* [Another Snag: `MPI`]({{site.baseurl}}{{page.url}}/#Another Snag: `MPI`)
* [Building QuantLib]({{site.baseurl}}{{page.url}}/#Building QuantLib)
* [What I Learned]({{site.baseurl}}{{page.url}}/#What I Learned)
* [Things Discovered]({{site.baseurl}}{{page.url}}/#Things Discovered)
* [Epilogue]({{site.baseurl}}{{page.url}}/#Epilogue)

<!--excerpt-->

<div id="Discovering RQuantLib"/>

###Discovering RQuantLib

I installed Chrome, some ALSA OSS audio packages to get the sounds working (volume still a bit low), and GNU R. I just wanted to have R installed in case the thirst of running it in a virtual machine strike me. To my delight, there are quite a few financial Math related packages on CRAN, where all R’s packages are hosted and distributed. Being a supposed professional on financial Math, I downloaded them all. Of these packages, there’s one called [RQuantLib](http://dirk.eddelbuettel.com/code/rquantlib.html){:target="_blank"} which would enable R to access a software/library called QuantLib.

<div id="Discovering QuantLib"/>

###Discovering QuantLib

It didn’t appear overly interesting to me. But having discovered R could potentially save me tons of work in MATLAB and C++ projects, I decided to have those packages installed on my Windows host, too.

All went well, installing packages in R involves just a few clicks here and there. But something weird struck me: under Windows, R couldn’t find any package named RQuantLib. I looked through the list, typed a few commands, and RQuantLib is just not there. Considering the mechanism of CRAN, and the fact that the package is available on Debian through a simple command `install.packages(‘RQuantLib’)`, this was totally unexpected. How is it possible? Off to Googling!

Search engines are lovely things. We’ve pretty much put all of our answer-searching hopes on them. Turns out RQuantLib needs to be pre-compiled for Windows version of R. Well, just how badly do I REALLY want this? After all it’s just an interface package that connects two software. Perhaps it would be more worthwhile to just use whatever software that the package is “interfacing”. At this point, I am no longer interested in getting RQuantLib to work on Windows, instead I want to know what this QuantLib is about.

The answer is right there, QuantLib is “a free/open-source library for quantitative finance”. What a coincidence! I’m in that field you know? Now I consider getting it and learning how to use it a task that must be done. And my “sleep session” has to be postponed.

<div id="Discovering Boost C++ Library"/>

###Discovering Boost C++ Library

So how exactly do I “get” this library? Luckily enough on [QuantLib’s website](http://quantlib.org){:target="_blank"} there is a guide on the installation and configuration. The first paragraph of the guide talks about something called “Boost”. Great, just another thing I have no idea about.

According to the description on [boost.org](http://www.boost.org/){:target="_blank"}, “Boost provides free peer-reviewed portable C++ source libraries.” I’m still working on the “portable” part, but I understand it alright. Boost is a software library, just like QuantLib. Some of its implementations are even taken into the next C++ programming standard (aptly called C++0x). So it would be good to learn Boost too. Firstly I need to get Boost working properly on my computer.

<div id="Getting Boost C++ to Work"/>

###Getting Boost C++ to Work

Per suggestion by the guide [Getting Started](http://www.boost.org/doc/libs/1_45_0/more/getting_started/index.html){:target="_blank"}, I downloaded the BoostPro installer. It didn’t quite work for me. I don’t like it for a couple of reasons:

* The installer is still 1.44 while Boost has been update to 1.45 by now.
* The installer downloads needed files on the fly. I’m more of an “offline” guy, which means I want to make sure I have all the files before installing them. I don’t trust my internet connection, and I don’t trust the downloading capability of the installer.
* The offline installer is only available to the BoostPro enterprise support program, which charges quite a few thousands for the service.
* The installer throws several errors at my way if the download mirror isn’t up to its liking.

So I’m going build and set it up by myself. But just to make sure I build it right, I’ve also installed BoostPro, so I have a “reference” installation I can compare to.

<div id="Another Snag: `MPI`"/>

###Another Snag: `MPI`

Hours (&gt;10) later, I passed out. I’m still not done yet. I’ve got Boost 1.45 compiled. But there’s this `MPI` library that is missing. Of course I searched again. `MPI`, Message Passing Interface, serves as a method for programs to communicate when they are on different computers, or so it seems to me. It is used in high performance computing because the cluster of computers needs to communicate and be coordinated when crunching an insane number of uh, numbers.

I don’t need this, but I wouldn’t mind to have it installed. So I went with OpenMPI. It proved to be an even more difficult task because I need to convert it to a VC solution before I can build it. So get files->CMake->Visual Studio->build. About 4 hours later, I’m convinced the library is built properly, and I’ve even built a nice install package. Now, time to finish building Boost.

<div id="Building QuantLib"/>

###Building QuantLib

The rest of building Boost went almost fine. Still a few `.lib`’s and `.dll`’s are not showing up but they are not necessary to my task. Now I’m more than eager to get to the real objective.

The current version of QuantLib is not prepared for Visual Studio 2010. In fact it won’t even build in VS2010. Every file has pre-compiler instructions that stop the compiler if the compiler version does not match. I had to go through the SVN repository and grab the trunk, which is VS2010-ready, as well as not release-ready.

The trunk is missing a few files, and my VS reacts nastily to the unicode-encoded sources. Eventually every library built successfully, but the test suite did not. Some linking errors.

Hmm, according to QuantLib FAQ, link error indicates Boost libraries are not included in my system PATH, which in fact are. Another No-Fucking-Idea situation. But it’s a test build, and I’m tired. So current build will have to do.

<div id="What I Learned"/>

###What I Learned

* My C++ skills are negligible.
* My understanding of software development is negligible.
* My sleep hours could use some improvement. I didn’t even realize my phone had run out of battery until the wife started sending emails to me.
* Visual Studio 2010 can build projects using VC9.0 compiler, but requires VS2008 to be installed to do that.
* Windows is not the optimal choice for open source stuff. I’m still puzzled with the `./` thing.
* Windows Live Writer sucks at formatting.
* I need to (do some other things).

<div id="Things Discovered"/>

###Things Discovered

QuantLib, Boost, MPI, NSIS, CMake, TortoiseSVN.

<div id="Epilogue"/>

###Epilogue

A few days later I tried the whole thing again, sans `MPI` this time. With the new Boost 1.46 source files I successfully compiled all the library files except `MPI` and `Graph_parallel`. However one of the tools `library_status` seems broken because version 1.45 worked fine. Nonetheless I have all the necessary and essential files now.

I checked out what seems to be a pre-release 1.1 branch of QuantLib source, and successully compiled all files in Visual Studio 2010. The previous trunk I had was indeed broken, since this time not a single error was found.

I dug deeper on Boost usage and am now preparing to rewrite part of my CreditMetrics project using the more advanced components Boost offers. Still a long way to go, for sure.


