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

## Adding items after init

    <div class="imgDisplaySpecial monoh" style="" itemscope itemtype="http://schema.org/ImageGallery">
      <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
      <a href="" itemprop="contentUrl">
      <img src="/assets/test/collage-1-600x800.jpg" itemprop="thumbnail" 
        title="A photo collage" 
        alt="A photo collage" /></a>
      </figure>
    </div>

    <script>
    var pswpElement = document.querySelectorAll('.pswp')[0];

    // build items array
    var items = [
      {
        src: '/assets/test/Touched-AW-3567-2560x1717.jpg',
        w: 2560,
        h: 1717,
        title: 'Slide 1'
      },
      {
        src: '/assets/test/Touched-AW-2791-2560x1580.jpg',
        w: 2560,
        h: 1580,
        title: 'Slide 2'
      },
      {
        src: '/assets/test/Touched-AW-2956-2560x1339.jpg',
        w: 2560,
        h: 1339,
        title: 'Slide 3'
      },
    ];

    // define options (if needed)
    var options = {
        // optionName: 'option value'
        // for example:
        index: 0 // start at first slide
    };

    // Initializes and opens PhotoSwipe
    var collage = new PhotoSwipe( pswpElement, PhotoSwipeUI_Default, items, options);
    collage.init();
    </script>

Note: `initPhotoSwipeFromDOM.js` is just an example of how to build a slide from a set of image links. Maybe we can try to modify it so that it is possible to call `var collage = new PhotoSwipe( p, P, i, o )` from on-page scripts while maintaining current link-reading capability and customizations.

What I'm trying to achieve: show a single image, which is a collage of multiple images itself, on the page. When clicked it would start showing actual images in that collage as slides. Current thoughts:

- use `imgDisplay` + `monod` to show the collage image, as usual;
- In on-page script call `var collage = new PhotoSwipe( p, P, i, o )` and then add slides via API: `pswp.items.push({ ... })`;
- To do that, while maintaining current customizations, `initPhotoSwipeFromDOM.js` needs to be dissected and restructured so that the function call `new PhotoSwipe( ... )` is exposed.
- I've tested the possibility to push an item and can confirm that it works as documented. However if a slide does not have a corresponding thumbnail on the page, the gallery would freeze upon hitting close. It is most likely because `initPhotoSwipeFromDOM.js` is not meant to handle such use case.

I am hopeful this can be done, without too much effort.


##Single Image, Centered

<div class="imgDisplay monod" style="max-width: 600px;" itemscope itemtype="http://schema.org/ImageGallery">
  <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
    <a href="/assets/images/maps-whistler-1024x486.png" itemprop="contentUrl" data-size="1024x486" >
    <img src="/assets/images/maps-whistler-600x285.png" itemprop="thumbnail" title="Satellite view of Whistler." alt="Satellite view of Whistler." />
    </a>
    <figcaption itemprop="caption description">Satellite view of Whistler.<br/><p class="tiny">Imagery ©2015 DigitalGlobe, Province of British Columbia, Map data ©2015 Google</p></figcaption>
  </figure>
</div>

##Slide with Fixed-width Thumbnails

<div class="imgDisplay monow" itemscope itemtype="http://schema.org/ImageGallery">
  <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
    <a href="/assets/old/DSC02385.jpg" itemprop="contentUrl" data-size="447x597">
    <img src="/assets/old/DSC02385-m.jpg" itemprop="thumbnail" title="A Pole" alt="A Pole" />
    </a>
    <figcaption itemprop="caption description">A Pole</figcaption>
  </figure>
  <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
    <a href="/assets/old/DSC02403.jpg" itemprop="contentUrl" data-size="600x450">
    <img src="/assets/old/DSC02403-m.jpg" itemprop="thumbnail" title="Much leaves." alt="Much leaves." />
    </a>
    <figcaption itemprop="caption description">Much leaves.</figcaption>
  </figure>
  <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
    <a href="/assets/old/DSC02409.jpg" itemprop="contentUrl" data-size="600x450">
    <img src="/assets/old/DSC02409-m.jpg" itemprop="thumbnail" title="Yellow and Green" alt="Yellow and Green" />
    </a>
    <figcaption itemprop="caption description">Yellow and Green</figcaption>
  </figure>
  <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
    <a href="/assets/old/DSC02411.jpg" itemprop="contentUrl" data-size="600x450">
    <img src="/assets/old/DSC02411-m.jpg" itemprop="thumbnail" title="Yellooooow and GREEEEEN" alt="Yellooooow and GREEEEEN" />
    </a>
    <figcaption itemprop="caption description">Yellooooow and GREEEEEN</figcaption>
  </figure>
</div>

##Slide with Fixed-height Thumbnails

<div class="imgDisplay monoh" itemscope itemtype="http://schema.org/ImageGallery">
  <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
    <a href="/assets/old/DSC02385.jpg" itemprop="contentUrl" data-size="447x597">
    <img src="/assets/old/DSC02385-m.jpg" itemprop="thumbnail" title="A Pole" alt="A Pole" />
    </a>
    <figcaption itemprop="caption description">A Pole</figcaption>
  </figure>
  <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
    <a href="/assets/old/DSC02403.jpg" itemprop="contentUrl" data-size="600x450">
    <img src="/assets/old/DSC02403-m.jpg" itemprop="thumbnail" title="Much leaves." alt="Much leaves." />
    </a>
    <figcaption itemprop="caption description">Much leaves.</figcaption>
  </figure>
  <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
    <a href="/assets/old/DSC02409.jpg" itemprop="contentUrl" data-size="600x450">
    <img src="/assets/old/DSC02409-m.jpg" itemprop="thumbnail" title="Yellow and Green" alt="Yellow and Green" />
    </a>
    <figcaption itemprop="caption description">Yellow and Green</figcaption>
  </figure>
  <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
    <a href="/assets/old/DSC02411.jpg" itemprop="contentUrl" data-size="600x450">
    <img src="/assets/old/DSC02411-m.jpg" itemprop="thumbnail" title="Yellooooow and GREEEEEN" alt="Yellooooow and GREEEEEN" />
    </a>
    <figcaption itemprop="caption description">Yellooooow and GREEEEEN</figcaption>
  </figure>
</div>

##Caveats

Due to the flowing nature of the container, neither of the thumbnail groups look overly nice on a narrow screen. But the fixed-height slide does not have those weird blanks when fitted into a small screen. The actual gallery overlay looks fine on all screens, pleasantly. The width and heights can also be overridden with internal CSS.

##Code

    ```html
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

    