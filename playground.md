---
layout: page
permalink: playground/
hide-page: true
comments: false
use-math: false
title: 操场 &bcong; Playground
---
This is the place I test things before they go online.

Last build date: {{ site.time | date_to_rfc822 }}

<p class="tiny">This is tiny class text</p>
<small>This is small text</small>

{% if site.data.options.devMode %}
  Success!
{% else %}
  Failed!
{% endif %}

Currently loading custom style sheet `/public/css/nicholaelaw.css`

    {% raw %}
    {% for gallery in site.data.galleries %}
    - [{{ gallery.description }}]({{ site.baseurl }}/{{ gallery.id }})
    {% endfor %}{% endraw %}

<!--Pretty Button Example-->

##Pretty Button Example: 

<a href="" class="act">Show</a>

<div class="collapsibleContent">
  <div class="imgContainer" style="border-radius: 35px; background-color: #AC4142;">
    <figure class="prettyButton" style="border-radius: 35px;">
    <a href="http://nicholaelaw.github.io" target="_blank">
    <img title="三喵暖"
        src="/assets/images/favicon-white-1024.png" 
        alt="三喵暖"
        style="margin-bottom:0;"/></a>
    <figcaption style="color: #FFFFFF; background-color: rgba(256,256,256,0.5);
        text-align: center;">
        三喵暖</figcaption>
    </figure>
  </div>
</div>

<script>
  $(".act").click(function(){
      
      var val = $(this).text();

  if (val == "Show") {
      $(".collapsibleContent").css('height', '100%');
      $(this).text("Hide");
  } else {
      $(".collapsibleContent").css('height', '0');
      $(this).text("Show");
  }
    return false;
  });
</script>

<!--Gallery/Image Display Example-->

##Expermental Image Display Routine

<div class="imgDisplay" itemscope itemtype="http://schema.org/ImageGallery">
  <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
    <a href="/assets/photos/the-little-one.jpg" itemprop="contentUrl" data-size="1019x1200">
    <img src="/assets/photos/the-little-one-m.jpg" itemprop="thumbnail" alt="Image description" />
    </a>
    <figcaption itemprop="caption description">一辈子的遗憾。</figcaption>
  </figure>
  <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
    <a href="https://farm3.staticflickr.com/2567/5697107145_a4c2eaa0cd_o.jpg" itemprop="contentUrl" data-size="1024x1024">
    <img src="https://farm3.staticflickr.com/2567/5697107145_3c27ff3cd1_m.jpg" itemprop="thumbnail" alt="Image description" />
    </a>
    <figcaption itemprop="caption description">Image caption  1</figcaption>
  </figure>
</div>

###Experiment on equal-height thumbnails

<div class="imgDisplayH" itemscope itemtype="http://schema.org/ImageGallery">
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
<p class="tiny">&nbsp;</p>

{% include pswpRoot.html %}

<div class="mapContainer">
  <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d37117.37047820854!2d-122.90857069939362!3d50.10410773648331!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e1!3m2!1sen!2sus!4v1441119013585" width="700" height="350" frameborder="0" style="border:0" allowfullscreen>
  </iframe>
</div>

