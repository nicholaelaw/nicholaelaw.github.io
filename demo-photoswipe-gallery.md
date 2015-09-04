---
layout: page
permalink: demo-photoswipe-gallery/
hide-page: true
comments: false
use-math: false
use-pswp: true
use-jquery: false
title: Demo Page&#58; PhotoSwipe Gallery
---

##How to

Things used in this demo:

* [PhotoSwipe](http://photoswipe.com/){:target="_blank"} for generating gallery overlays;
* Custom CSS sheets defining classes for single image, fixed-width slide and fixed-height slide;

Code structure:

* PhotoSwipe CSS and JavaScript;
* Class `imgDisplay` to signify a photo gallery;
* Classes `monod`, `monow` and `monoh` for single image, fixed-width slide and fixed-height slide styles;
* A separate `html` document adding `pswp` root elements to the page;
* Vanilla `initPhotoSwipeFromDOM.js`.

<!--Gallery/Image Display Example-->

##Single Image, Centered

<div class="imgDisplay monod" style="max-width: 600px;" itemscope itemtype="http://schema.org/ImageGallery">
  <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
    <a href="/assets/images/maps-whistler-1024x486.png" itemprop="contentUrl" data-size="1024x486" >
    <img src="/assets/images/maps-whistler-600x285.png" itemprop="thumbnail" alt="Satellite view of Whistler." />
    </a>
    <figcaption itemprop="caption description">Satellite view of Whistler.<br/><p class="tiny">Imagery ©2015 DigitalGlobe, Province of British Columbia, Map data ©2015 Google</p></figcaption>
  </figure>
</div>

##Slide with Fixed-width Thumbnails

<div class="imgDisplay monow" itemscope itemtype="http://schema.org/ImageGallery">
  <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
    <a href="/assets/old/DSC02385.jpg" itemprop="contentUrl" data-size="447x597">
    <img src="/assets/old/DSC02385-m.jpg" itemprop="thumbnail" alt="我在想如果照的是信号灯的正面会不会好点。" />
    </a>
    <figcaption itemprop="caption description">我在想如果照的是信号灯的正面会不会好点。</figcaption>
  </figure>
  <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
    <a href="/assets/old/DSC02403.jpg" itemprop="contentUrl" data-size="600x450">
    <img src="/assets/old/DSC02403-m.jpg" itemprop="thumbnail" alt="可能颜色不到位，可是怎么才到位呢？" />
    </a>
    <figcaption itemprop="caption description">可能颜色不到位，可是怎么才到位呢？</figcaption>
  </figure>
  <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
    <a href="/assets/old/DSC02409.jpg" itemprop="contentUrl" data-size="600x450">
    <img src="/assets/old/DSC02409-m.jpg" itemprop="thumbnail" alt="拍这张的时候很累。" />
    </a>
    <figcaption itemprop="caption description">拍这张的时候很累。</figcaption>
  </figure>
  <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
    <a href="/assets/old/DSC02411.jpg" itemprop="contentUrl" data-size="600x450">
    <img src="/assets/old/DSC02411-m.jpg" itemprop="thumbnail" alt="拍这张的时候很刺眼。" />
    </a>
    <figcaption itemprop="caption description">拍这张的时候很刺眼。</figcaption>
  </figure>
</div>

##Slide with Fixed-height Thumbnails

<div class="imgDisplay monoh" itemscope itemtype="http://schema.org/ImageGallery">
  <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
    <a href="/assets/old/DSC02385.jpg" itemprop="contentUrl" data-size="447x597">
    <img src="/assets/old/DSC02385-m.jpg" itemprop="thumbnail" alt="我在想如果照的是信号灯的正面会不会好点。" />
    </a>
    <figcaption itemprop="caption description">我在想如果照的是信号灯的正面会不会好点。</figcaption>
  </figure>
  <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
    <a href="/assets/old/DSC02403.jpg" itemprop="contentUrl" data-size="600x450">
    <img src="/assets/old/DSC02403-m.jpg" itemprop="thumbnail" alt="可能颜色不到位，可是怎么才到位呢？" />
    </a>
    <figcaption itemprop="caption description">可能颜色不到位，可是怎么才到位呢？</figcaption>
  </figure>
  <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
    <a href="/assets/old/DSC02409.jpg" itemprop="contentUrl" data-size="600x450">
    <img src="/assets/old/DSC02409-m.jpg" itemprop="thumbnail" alt="拍这张的时候很累。" />
    </a>
    <figcaption itemprop="caption description">拍这张的时候很累。</figcaption>
  </figure>
  <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
    <a href="/assets/old/DSC02411.jpg" itemprop="contentUrl" data-size="600x450">
    <img src="/assets/old/DSC02411-m.jpg" itemprop="thumbnail" alt="拍这张的时候很刺眼。" />
    </a>
    <figcaption itemprop="caption description">拍这张的时候很刺眼。</figcaption>
  </figure>
</div>

##Caveats

Due to the flowing nature of the container, neither of the thumbnail groups look overly nice on a narrow screen. But the fixed-height slide does not have those weird blanks when fitted into a small screen. The actual gallery overlay looks fine on all screens, pleasantly. The width and heights can also be overridden with internal CSS.

##Code

    <!-- Single image -->
    <div class="imgDisplay monod" style="max-width: 600px;" itemscope itemtype="http://schema.org/ImageGallery">
      <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
        <a href="/assets/images/maps-whistler-1024x486.png" itemprop="contentUrl" data-size="1024x486" >
        <img src="/assets/images/maps-whistler-600x285.png" itemprop="thumbnail" alt="Satellite view of Whistler." />
        </a>
        <figcaption itemprop="caption description">Satellite view of Whistler.<br/><p class="tiny">Imagery ©2015 DigitalGlobe, Province of British Columbia, Map data ©2015 Google</p></figcaption>
      </figure>
    </div>
    <!-- Fixed-width slide -->
    <div class="imgDisplay monow" itemscope itemtype="http://schema.org/ImageGallery">
      <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
        <a href="/assets/old/DSC02385.jpg" itemprop="contentUrl" data-size="447x597">
        <img src="/assets/old/DSC02385-m.jpg" itemprop="thumbnail" alt="我在想如果照的是信号灯的正面会不会好点。" />
        </a>
        <figcaption itemprop="caption description">我在想如果照的是信号灯的正面会不会好点。</figcaption>
      </figure>
      <!-- add more images here -->
    </div>
    <!-- Fixed-height slide -->
    <div class="imgDisplay monoh" itemscope itemtype="http://schema.org/ImageGallery">
      <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
        <a href="/assets/old/DSC02385.jpg" itemprop="contentUrl" data-size="447x597">
        <img src="/assets/old/DSC02385-m.jpg" itemprop="thumbnail" alt="我在想如果照的是信号灯的正面会不会好点。" />
        </a>
        <figcaption itemprop="caption description">我在想如果照的是信号灯的正面会不会好点。</figcaption>
      </figure>
      <!-- add more images here -->
    </div>

    <style>
    /* photoswipe image gallery 
     * common container class
     * for easy js invoking*/
     .imgDisplay {}
     .imgDisplay figure {}
     .imgDisplay img {}
     .imgDisplay figcaption {}

    /* Classes for single image display,
     * fixed-width slide and
     * fixed-height slide galleries
     */
    .monoh, .monow {
      width: 100%;
      float: left;
      clear: both;
      margin-bottom: 0.7rem;
    }
    .monod {
      position: relative;
      margin: 0 auto;
    }
    .monoh figure {
      display: block;
      float: left;
      margin: 0 5px 5px 0;
      height: 120px;
      width: auto;
    }
    .monow figure {
      display: block;
      float: left;
      margin: 0 5px 5px 0;
      width: 150px;
      height: auto;
    }
    .monod figure {
      display: block;
      margin: 0 auto;
      width: 100%;
      height: auto;
    }
    .monoh img {
      width: auto;
      height: 100%;
    }
    .monow img, .monod img {
      width: 100%;
      height: auto;
    }
    .monoh figcaption, .monow figcaption, .monod figcaption {
      display: none;
    }
    </style>

    