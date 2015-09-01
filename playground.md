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

<style>
.imgDisplay figure {
  height: 180px;
}
</style>


<!--Original PhotoSwipe Example-->

##First gallery:

<div class="imgDisplay" itemscope itemtype="http://schema.org/ImageGallery">

  <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
    <a href="https://farm3.staticflickr.com/2567/5697107145_a4c2eaa0cd_o.jpg" itemprop="contentUrl" data-size="1024x1024">
    <img src="https://farm3.staticflickr.com/2567/5697107145_3c27ff3cd1_m.jpg" itemprop="thumbnail" alt="Image description" />
    </a>
    <figcaption itemprop="caption description">Image caption  1</figcaption>
  </figure>

  <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
    <a href="https://farm2.staticflickr.com/1043/5186867718_06b2e9e551_b.jpg" itemprop="contentUrl" data-size="964x1024">
    <img src="https://farm2.staticflickr.com/1043/5186867718_06b2e9e551_m.jpg" itemprop="thumbnail" alt="Image description" />
    </a>
    <figcaption itemprop="caption description">Image caption 2</figcaption>
  </figure>

  <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
    <a href="/assets/photos/the-little-one.jpg" itemprop="contentUrl" data-size="1019x1200">
    <img src="/assets/photos/the-little-one-m.jpg" itemprop="thumbnail" alt="Image description" />
    </a>
    <figcaption itemprop="caption description">一辈子的遗憾。</figcaption>
  </figure>

  <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
    <a href="https://farm7.staticflickr.com/6175/6176698785_7dee72237e_b.jpg" itemprop="contentUrl" data-size="1024x683">
    <img src="https://farm7.staticflickr.com/6175/6176698785_7dee72237e_m.jpg" itemprop="thumbnail" alt="Image description" />
    </a>
    <figcaption itemprop="caption description">Image caption 3</figcaption>
  </figure>

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
    <figcaption itemprop="caption description">Image caption  6</figcaption>
  </figure>

</div>

<h2>Second gallery:</h2>

<div class="imgDisplay" itemscope itemtype="http://schema.org/ImageGallery">

  <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
    <a href="https://farm2.staticflickr.com/1043/5186867718_06b2e9e551_b.jpg" itemprop="contentUrl" data-size="964x1024">
    <img src="https://farm2.staticflickr.com/1043/5186867718_06b2e9e551_m.jpg" itemprop="thumbnail" alt="Image description" />
    </a>
    <figcaption itemprop="caption description">Image caption 2.1</figcaption>
  </figure>

  <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
    <a href="https://farm7.staticflickr.com/6175/6176698785_7dee72237e_b.jpg" itemprop="contentUrl" data-size="1024x683">
    <img src="https://farm7.staticflickr.com/6175/6176698785_7dee72237e_m.jpg" itemprop="thumbnail" alt="Image description" />
    </a>
    <figcaption itemprop="caption description">Image caption 2.2</figcaption>
  </figure>

</div>

{% include pswpRoot.html %}



