---
layout: post
permalink: Getting-Rid-of-MagicISO/
comments: true
date: 2011-02-19 22:51:54.000000000 +08:00
tags:
- dmg
- Mac
- MagicISO
- OS X
- VMware
- computer ≌ 计算机
- tinker ≌ 折腾
- rant ≌ 吐槽
title: Dealing with .dmg files on Windows and Getting Rid of MagicISO
---

I recently tried to install Mac OS X on a virtual machine. The first step is to obtain an OS X installation DVD image. That wasn’t hard, only that the image I got was in Apple .dmg format. So as a result, I needed to convert it to a format that I can mount in VMware. Namely make it a standard ISO file.

Posts around the interweb offer numerous options. I don’t like things like TransMac which allows you to directly read Mac-related files, because these solutions usually involves installing software, even drivers. Not to mention most of them aren’t free.

<!--excerpt-->

I like to keep it simple. A command line tool that simply converts files. So I ended up with dmg2img. Exactly what I want, but it didn’t work for me. The image file I had must have been compressed and modified because dmg2img couldn’t finish converting  it. It always stops at ~30% inflation and then an error pops up. I initially thought the image I had was corrupted and downloaded it again (yes I’ve been naughty). In the end I decided it was dmg2img that’s having problems, not the image file.

So the “free” route seems a dead end. I went on searching for conversion software. Somebody mentions MagicISO can handle .dmg files, so I tried it out. Turns out MagicISO couldn’t even recognize my image file, let alone convert it. Remove, and move on to the next, UltraISO.

UltraISO is an amazing piece of software that really deserves the money. I’ve used it before, and I should’ve chosen it in the beginning. So, UltraISO gets the job done, and now I’m a pseudo-Mac user. Happily ever after.

Only there’s always a snag. Turns out the guys behind MagicISO employed some sneaky tactics. I noticed the MagicISO context menu command was still there after I’ve removed the software. At first I thought it was just a sloppy uninstall job, but as soon as I clicked on one of the command I realized this is intentionally left behind. Because instead of a standard “XX not found” type of error, a dialogue box shows up and tells you MagicISO wasn’t installed, and click a button to download and install it!

(I’d love to post a picture but I’ve already had it removed, and I’m a lazy person.)

OK then, I remember nothing about context menu during either install or uninstall process, so they wanted this little handle to be left behind so that unwitting users would go and install their software again, and hopefully pay for it in the process. I’m not that generous nor have I the intention of leaving it alone. I want that menu off my system.

I don’t want to use yet another system utility to clean up the mess because the more complicated the solution become the more probability something will go wrong. I complied and downloaded and installed and removed MagicISO again. Only this time I chose “Custom” in the uninstaller. The installer has faithfully kept a record of everything modified during installation, including the context menu. When in Custom mode the uninstaller offers the option to undo any and all of those changes. So simply select all in every step, and **reboot the computer** when done. Now the world is a little bit quieter. No more pesky context menu, no more MagicISO!
