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

* [QR code in a tooltip]({{site.baseurl}}/demo-qr-code-in-tooltip/)
* [PhotoSwipe Gallery]({{site.baseurl}}/demo-photoswipe-gallery/)
* [iFrame Containers]({{site.baseurl}}/demo-iframe-containers/)

## FA as list mark
<ul class="fa-ul">
  <li><i class="fa-li fa fa-check"></i>Coffee</li>
  <li><i class="fa-li fa fa-check"></i>Tea</li>
  <li><i class="fa-li fa fa-check"></i>Coca Cola</li>
  <li><i class="fa-li fa fa-spinner fa-pulse"></i>Burp</li>
  <li><i class="fa-li fa fa-refresh fa-pulse"></i>Mountain Dew</li>
</ul>

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


