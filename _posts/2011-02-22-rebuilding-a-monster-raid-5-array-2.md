---
layout: post
permalink: Rebuilding-A-Monster-RAID-5-Array
comments: true
date: 2011-02-22 12:55:09.000000000 +08:00
tags:
- hard drive
- RAID
title: Rebuilding A Monster RAID 5 Array
---

<div class="imgDisplayS" style="max-width: 600px;" itemscope itemtype="http://schema.org/ImageGallery">
  <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
    <a href="/assets/old/current-gaia1-757x456.png" itemprop="contentUrl" data-size="757x456" >
    <img src="/assets/old/current-gaia1-757x456.png" itemprop="thumbnail" 
      title="This is when hi-def is still in its infancy." 
      alt="This is when hi-def is still in its infancy." />
    </a>
    <figcaption itemprop="caption description">This is when hi-def is still in its infancy.</figcaption>
  </figure>
</div>

I call it GAIA. Because almost everything digital that I have is stored in it. It is the giant pool of data where they go on to serve my need and return when finished. It’s where the cycle begin and where it ends.

<!--excerpt-->

Enough with the poetry, today I decided to give my array an upgrade. It wouldn’t be easy, and I’ve been putting it off for a few months now. Mainly because I’m lazy, and partially because it is time consuming.

Since I don’t have a backup device (bad practice!) to save all those bits on this volume, I’d have to perform a “live” style upgrade. I’d have to swap out drives one at a time, and let it rebuild between drives. It could take a week to replace all 8 drives, and it seems this week is good. I’ve done plenty of research on the feasibility of this plan, and I’d say my chances is good enough. Of course if I screw up I’d lose more than 2TB of ripped movies, porns, software (some of which are bought and paid for), and backups. Scary……and I’m easily scared.

Having garnered enough courage, I unplugged the first drive. It’s been a naughty boy, constantly running on 50 degrees Celsius, and it is suspected to occasionally give the entire array a little lockup. So it must go.

<div class="imgDisplayS" style="max-width: 600px;" itemscope itemtype="http://schema.org/ImageGallery">
  <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
    <a href="/assets/old/wd-drive-800x532.jpg" itemprop="contentUrl" data-size="800x532" >
    <img src="/assets/old/wd-drive-800x532.jpg" itemprop="thumbnail" 
      title="It's just a bad batch." 
      alt="It's just a bad batch." />
    </a>
    <figcaption itemprop="caption description">It's just a bad batch.</figcaption>
  </figure>
</div>

I must say I was surprised an “enterprise” level hard drive runs this hot. Never mind. Now enter the new guy:

<div class="imgDisplayS" style="max-width: 600px;" itemscope itemtype="http://schema.org/ImageGallery">
  <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
    <a href="/assets/old/new-guy-800x532.jpg" itemprop="contentUrl" data-size="800x532" >
    <img src="/assets/old/new-guy-800x532.jpg" itemprop="thumbnail" 
      title="Too bad Hitachi got bought by WD. But it lives." 
      alt="Too bad Hitachi got bought by WD. But it lives." />
    </a>
    <figcaption itemprop="caption description">Too bad Hitachi got bought by WD. But it lives.</figcaption>
  </figure>
</div>

Quite a drive. I like Hitachi drives. Even though they had a bad name at a time. I’ve never had a Hitachi drive fail on me, and I own 3 of them. On the contrary, I’ve had 2 out of 4 WD drives fail on me shortly after warranty expired. After that I’ve gradually phased out all WD drives in my system. Ok enough bitching let’s get down to business.

<div class="imgDisplayS" style="max-width: 600px;" itemscope itemtype="http://schema.org/ImageGallery">
  <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
    <a href="/assets/old/drive-1-unplugged1-737x167.png" itemprop="contentUrl" data-size="737x167" >
    <img src="/assets/old/drive-1-unplugged1-737x167.png" itemprop="thumbnail" 
      title="Controller: Beeeeeeeeeeeeeeeeepppppp" 
      alt="Controller: Beeeeeeeeeeeeeeeeepppppp" />
    </a>
    <figcaption itemprop="caption description">Controller: Beeeeeeeeeeeeeeeeepppppp</figcaption>
  </figure>
</div>

The controller gave out a nasty cry when I pulled out the drive. I swapped the rail and put the new drive in. Now it is rebuilding all those precious bits.

<div class="imgDisplayS" style="max-width: 600px;" itemscope itemtype="http://schema.org/ImageGallery">
  <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
    <a href="/assets/old/rebuild-11-757x173.png" itemprop="contentUrl" data-size="757x173" >
    <img src="/assets/old/rebuild-11-757x173.png" itemprop="thumbnail" 
      title="I'm scared to look at it." 
      alt="I'm scared to look at it." />
    </a>
    <figcaption itemprop="caption description">I'm scared to look at it.</figcaption>
  </figure>
</div>

Only one thing to do: wait. Waiting sucks.

Already 22%. Even though that estimate is not to be trusted, it sound pretty good to me.

And now it’s done. I’ll wait a while before swapping the next drive, in case something goes boom. I also need that game (Bulletstorm!) to finish downloading so I can give it a try.

Feb. 25: I’ve already swapped 4 drives by now. Individually the new drives perform a little bit better than the old ones, but it remains to be seen how well they perform in the array. I’ve just got my hands on the remaining four drives, and am putting them through their paces right now. Once they are cleared from DOA status I’ll put them into the build.

Feb. 27: Only two to go! I’ve hit a pretty nasty snag last night. When replacing the 6th drive, the controller consistently went non-responsive during rebuild. Windows wouldn’t shutdown (apparently because it is waiting for the RAID driver to acknowledge the shutdown command). After a cold reboot I find myself staring at the controller BIOS screen saying “Scanning for devices”. It seems that the controller is having a hard time reading the drives. The only thing that worked was to put the old drive back in; it was recognized and I can boot into Windows. After running back and forth swapping drives, I began to suspect the controller was overheating. Because it stopped responding in about one minute after booting into Windows and starts rebuilding. So I jury-rigged a 140mm fan blowing right at the controller heatsink, and the problem seems to be solved.

However I didn’t discover the true cause of the problem until moments ago. The main 140mm fan responsible for sucking air in from under the case and blowing into the motherboard chamber was not working! Therefore the only thing that keeps the air flowing was the exhaust fans at the top of the case. Apparently this way there’s not enough cold air going through the PCI-E cards, which in my case are two hardware RAID controller and an HD 5970, each of which produces considerable amount of heat going nowhere.

This explains the hissing noise from the video card during those cold reboot. Normally it happens when I’m gaming something fierce and the card is super hot. I should’ve noticed the oddity which would’ve saved me hours of running back and forth. A lesson learned. At least nothing is toast.

By tonight, all eight drives would have been replaced. I’ll post a benchmark once its done. I’m aiming for 600MB/s sustained transfer speed with the new drives.

*To be continued…[^continue]*

[^continue]: I eventually replaced all of the drives with 2TB ones. I get 800MB/s throughput on a good day.

{% include pswpRoot.html %}

