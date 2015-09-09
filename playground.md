---
layout: page
permalink: playground/
hide-page: true
comments: false
use-math: false
use-pswp: false
use-jquery: true
title: 操场 &bcong; Playground
---

## Site Status

| `Dev Mode` | `Extra CSS` | `JavaScript` | 
|:----------:|:-----------:|:------------:|
|{% if site.data.options.devMode %}`ON`{% else %}`OFF`{% endif %} | {% if site.data.options.extraCSS %}`ALLOWED`{% else %}`NOT ALLOWED`{% endif %} | {% if site.data.options.javaScript %}`ALLOWED`{% else %}`NOT ALLOWED`{% endif %}| 

## Playground Status

| `Comments` |   `Math`   |   `PSWP`   |  `jQuery`  |
|:----------:|:----------:|:----------:|:----------:|
| {% if page.comments %}`ON`{% else %}`OFF`{% endif %} | {% if page.use-math %}`ON`{% else %}`OFF`{% endif %} | {% if page.use-pswp %}`ON`{% else %}`OFF`{% endif %} | {% if page.use-jquery %}`ON`{% else %}`OFF`{% endif %} |

`Last build date: {{ site.time | date_to_rfc822 }}` 

<!-- Activated scripts & CSS -->

<script type="text/javascript" src="/public/js/jquery.qrcode.min.js"></script>
<script type="text/javascript" src="/public/js/list.js"></script>
<script type="text/javascript" src="/public/js/jquery.tooltipster.min.js"></script>
<script type="text/javascript" src="/public/js/jquery-collapse-with-storage.min.js"></script>
<link rel="stylesheet" href="{{ site.baseurl }}/public/css/font-awesome.css"/>
<link rel="stylesheet" href="{{ site.baseurl }}/public/css/tooltipster/tooltipster.css"/>
<link rel="stylesheet" href="{{ site.baseurl }}/public/css/tooltipster/tooltipster-shadow.css"/>


## Finished Experiments:

<ul class="fa-ul">
  <li><i class="fa-li fa fa-check"></i><a 
  href="{{site.baseurl}}/demo-qr-code-in-tooltip/">QR code in a tooltip</a></li>
  <li><i class="fa-li fa fa-check"></i><a 
  href="{{site.baseurl}}/demo-photoswipe-gallery/">PhotoSwipe Gallery</a></li>
  <li><i class="fa-li fa fa-check"></i><a 
  href="{{site.baseurl}}/demo-iframe-containers/">iFrame Containers</a></li>
  <li><i class="fa-li fa fa-check"></i><a 
  href="{{site.baseurl}}/tags/">Sortable Tag List and Article Links (List.js Powered)</a></li>
  <li><i class="fa-li fa fa-check"></i><a href="{{site.baseurl}}/fa-icon-list/">A Complete Searchable-Sortable-Icon-Name-in-the-Tooltip List of Font Awesome Icons</a></li>
</ul>

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



    {% raw %}
    {% for gallery in site.data.galleries %}
    - [{{ gallery.description }}]({{ site.baseurl }}/{{ gallery.id }})
    {% endfor %}{% endraw %}

<!--Pretty Button Example-->

## Pretty Button Example: 

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

## A dummy heading