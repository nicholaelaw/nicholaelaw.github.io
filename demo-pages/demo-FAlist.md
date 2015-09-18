---
layout: page
permalink: demo-fa-icon-list/
hide-page: true
comments: false
use-math: false
use-pswp: false
use-jquery: true
title: FA图标列表 &bcong; Font Awesome List
---

<link rel="stylesheet" href="{{ site.baseurl }}/public/css/font-awesome.css"/>
<link rel="stylesheet" href="{{ site.baseurl }}/public/css/tooltipster/tooltipster.css"/>
<link rel="stylesheet" href="{{ site.baseurl }}/public/css/tooltipster/tooltipster-shadow.css"/>
<script type="text/javascript" src="/public/js/list.js"></script>
<script type="text/javascript" src="/public/js/jquery.tooltipster.min.js"></script>

Browse, or type something, to see if you get what you are looking for. Click on the icons to get its CSS class, and Unicode string. For more information on how to use, visit [Font Awesome](http://fortawesome.github.io/Font-Awesome/){:target="_blank"}. For more information about this page, see [关于本页 &#8780; About this Page]({{site.baseurl}}{{page.url}}#关于本页-About this Page).

<div id="icons">
  <h2>All Icons in Font Awesome 4.4</h2>
  <input type="text" class="search" placeholder="eg. heart">
  <button class="sort defaultBtn" data-sort="icon" data-insensitive="true">Sort by Name</button>
  <ul class="list">
  {% for icon in site.data.fa-icons %}
  <li><a href="#" onclick="return false" class="icon tooltip" title="<code>{{ icon.name }} [{{icon.unicode}}]</code>" border="1px solid black"><i class="fa {{ icon.name }} fa-fw fa-3x"></i></a></li>
  {% endfor %}
  </ul>
</div>

<div id="关于本页-About this Page" ></div>

### 关于本页 &#8780; About this Page

[Font Awesome](http://fortawesome.github.io/Font-Awesome/){:target="_blank"} is an amazing package of free web icons to build your site with. It's easy to use and most pleasing to the eyes. You can do almost anything icon-related with the accompanying CSS kit: spinning, flipped, scaled or set as a list bulletin. How cool is that!

But I can never remember all those names! In fact, I can't even remember the names of those that interests me. So I pieced together this page mostly using codes scavenged from all over the web and a list of icons which I extracted from the source of the official listing using regex. Yes, I'm feeling pretty good right now. 

<style>
  .list {
    list-style: none;
    padding: 0;
  }
  .list li {
    display: inline-block;
    margin: 0 1rem 1rem 0;
  }
  .search {
    font-size: 1rem;
  }
</style>

<script>
$(document).ready(function() {
  $('.tooltip').tooltipster({
    theme: 'tooltipster-shadow',
    contentAsHTML: true,
    trigger: 'click',
    position: 'bottom',
  });

  var options = {
  valueNames: [ 'icon' ],
  page: 700
  };

  var tagList = new List('icons', options);
  tagList.sort('icon', { order: "asc" });
});

</script>
