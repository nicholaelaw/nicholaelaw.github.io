---
layout: page
permalink: playground/
hide-page: true
comments: false
use-math: false
use-pswp: true
use-jquery: true
title: 操场 &bcong; Playground
---
Last build date: {{ site.time | date_to_rfc822 }}

## This is the place I test things before they go online. 

<!-- Activated scripts & CSS-->
<script type="text/javascript" src="/public/js/jquery.qrcode.min.js"></script>
<script type="text/javascript" src="/public/js/list.js"></script>
<script type="text/javascript" src="/public/js/jquery.tooltipster.min.js"></script>
<script type="text/javascript" src="/public/js/jquery-collapse-with-storage.min.js"></script>
<link rel="stylesheet" href="{{ site.baseurl }}/public/css/font-awesome.css"/>
<link rel="stylesheet" href="{{ site.baseurl }}/public/css/tooltipster/tooltipster.css"/>
<link rel="stylesheet" href="{{ site.baseurl }}/public/css/tooltipster/tooltipster-shadow.css"/>

## Finished Experiments:

* [QR code in a tooltip]({{site.baseurl}}/qr-code-in-tooltip/)

##QR Code generation
<div id='qrcollapse' data-collapse>
  <p id='qrbtn'>扫一扫</p>
  <div id="qrcode" style="position: absolute; max-width: 300px; max-height: 300px; padding: 1rem; background-color: white; border: 1px solid black; border-radius: 5px;"></div>
</div>
<script>
$('#qrbtn').click(function(){
  $('#qrcode').empty().qrcode({
    width: 256,
    height: 256,
    text: 'http://nicholaelaw.github.io/%E4%B8%80%E4%B8%AA%E6%9C%88%E7%9A%84%E6%B1%89%E5%AF%86%E5%B0%94%E9%A1%BF'
  });
});
</script>

<div id="relatedposts" data-collapse>
  <h2>Better Related Posts</h2>
<code><pre>
{% raw %} 
{% assign hasSimilar = '' %}
{% for post in site.related_posts %}
    {% assign postHasSimilar = false %}
    {% for tag in post.tags %}
        {% for thisTag in page.tags %}
            {% if postHasSimilar == false and hasSimilar.size < 6 and post != page and tag == thisTag %}
                {% if hasSimilar.size == 0 %}
                <h4>Similar Posts</h4>
                <ul>
                {% endif %}
                <li class="relatedPost">
                    <a href="{{ site.url }}{{ post.url }}">{{ post.title }}
                    {% if post.series %}
                        (Series: {{ post.series }})
                    {% endif %}
                    </a>
                </li>
                {% capture hasSimilar %}{{ hasSimilar }}*{% endcapture %}
                {% assign postHasSimilar = true %}
            {% endif %}
        {% endfor %}
    {% endfor %}
{% endfor %}
{% if hasSimilar.size > 0 %}
    </ul>
{% endif %}
{% endraw %}
</pre></code>
</div>

## <i class="fa fa-fighter-jet"></i>Font Awesome


<div class="list-group">
  <a class="list-group-item" href="#"><i class="fa fa-home fa-fw"></i>&nbsp; Home</a>
  <a class="list-group-item" href="#"><i class="fa fa-book fa-fw"></i>&nbsp; Library</a>
  <a class="list-group-item" href="#"><i class="fa fa-pencil fa-fw"></i>&nbsp; Applications</a>
  <a class="list-group-item" href="#"><i class="fa fa-cog fa-fw"></i>&nbsp; Settings</a>
</div>

## List.js

<div id="users">
  <h3>Basic example of List.js in action</h3>
  <input class="search" placeholder="Search" />
  <button class="sort" data-sort="name">Sort by name</button>
  <button class="sort" data-sort="born">Sort by year born</button>
  <div class="list">
    <div>
      <h3 class="name">Jonny Strömberg</h3>
      <p class="born">1990</p>
    </div>
    <div>
      <h3 class="name">Jonas Arnklint</h3>
      <p class="born">1985</p>
    </div>
    <div>
      <h3 class="name">Martina Elm</h3>
      <p class="born">1986</p>
    </div>
    <div>
      <h3 class="name">Gustaf Lindqvist</h3>
      <p class="born">1983</p>
    </div>
  </div>
</div>
<script>
var options = {
  valueNames: [ 'name', 'born' ]
};

var userList = new List('users', options);
</script>


## [jQuery Collapse](http://webcloud.se/jQuery-Collapse/){:target="_blank"}

<div id="demo" data-collapse>
  <h2>Fruits</h2>
  <ul>
    <li>Apple</li>
    <li>Pear</li>
    <li>Orange</li>
    <li>Banana</li>
  </ul>
  <h2>Info</h2>
  <div>
    <p>You can use any container you like (in this case a div element)</p>
  </div>
</div>


<p class="tiny">This is tiny class text</p>
<small>This is small text</small>

{% if site.data.options.devMode %}
  devMode On
{% else %}
  devMode Off
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

##Expermental on single Image Display Routine

<div class="imgDisplay monod" style="max-width: 600px;" itemscope itemtype="http://schema.org/ImageGallery">
  <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
    <a href="/assets/images/maps-whistler-1024x486.png" itemprop="contentUrl" data-size="1024x486" >
    <img src="/assets/images/maps-whistler-600x285.png" itemprop="thumbnail" alt="Satellite view of Whistler." />
    </a>
    <figcaption itemprop="caption description">Satellite view of Whistler.<br/><p class="tiny">Imagery ©2015 DigitalGlobe, Province of British Columbia, Map data ©2015 Google</p></figcaption>
  </figure>
</div>

##Expermental on fixed-width Image Display Routine

<div class="imgDisplay monow" itemscope itemtype="http://schema.org/ImageGallery">
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

##Experiment on fixed-height thumbnails

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
<p class="tiny">&nbsp;</p>

##Maps Container

<div class="mapContainer">
  <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d37117.37047820854!2d-122.90857069939362!3d50.10410773648331!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e1!3m2!1sen!2sus!4v1441119013585" width="700" height="350" frameborder="0" style="border:0" allowfullscreen>
  </iframe>
</div>

