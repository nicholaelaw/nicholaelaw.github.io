---
layout: post
permalink: Getting-Adobe-Acrobat-X-Context-Menu-Back/
comments: true
no-excerpt: true
use-pswp: true
date: 2011-02-21 03:45:32.000000000 +08:00
tags:
- acrobat
- context menu ≌ 右键菜单
- computer ≌ 计算机
- tinker ≌ 折腾
title: Getting Adobe Acrobat X Context Menu Back
---

<div class="imgDisplay monod" style="max-width: 341px;" itemscope itemtype="http://schema.org/ImageGallery">
  <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
    <a href="/assets/old/acrobat-context-menu-341x233.png" itemprop="contentUrl" data-size="341x233" >
    <img src="/assets/old/acrobat-context-menu-341x233.png" itemprop="thumbnail" 
      title="I still use some of the tools in that menu." 
      alt="I still use some of the tools in that menu." />
    </a>
    <figcaption itemprop="caption description">I still use some of the tools in that menu.</figcaption>
  </figure>
</div>

Somehow the “Combine supported files in Acrobat” context menu went missing on my Windows 7 64-bit system. I hate moments like this.

Luckily there is a solution readily available from Adobe forums: under command prompt, navigate to `<acrobat install folder>\Acrobat Elements\`, then register `ContextMenu64.dll`. A reboot is not required, to my surprise.

<div class="imgDisplay monod" style="max-width: 600px;" itemscope itemtype="http://schema.org/ImageGallery">
  <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
    <a href="/assets/old/windows-cmd-690x128.png" itemprop="contentUrl" data-size="690x128" >
    <img src="/assets/old/windows-cmd-690x128.png" itemprop="thumbnail" 
      title="Good'ol cmd" 
      alt="Good'ol cmd" />
    </a>
    <figcaption itemprop="caption description">Good'ol cmd</figcaption>
  </figure>
</div>

For easy copy-paste:

	>regsvr32 contextmenu64.dll

Whatever screwed up my system, damn you, damn you to hades.

