---
layout: page
permalink: tags/
hide-page: true
comments: false
use-math: false
use-pswp: false
use-jquery: false
title: 标签 &bcong; Tags
---
<script type="text/javascript" src="/public/js/list.js"></script>
<link rel="stylesheet" href="{{ site.baseurl }}/public/css/font-awesome.css"/>

<div id="tags">
  <h3>Tags in this blog:</h3>
  <input type="text" class="search" placeholder="Search for tags">
  <button class="sort" data-sort="tag" data-insensitive="true">Sort tags</button>
  <ul class="list">
    {% for tag in site.tags %}
    <li><a href="#{{ tag | first | slugize }}" class="tag"><code>{{ tag | first }}</code></a></li>
    {% endfor %}
  </ul>
</div>


{% for tag in site.tags %}
{% capture tag_name %}{{ tag | first }}{% endcapture %}
<div id="{{ tag_name | slugize }}" ></div>

### `{{ tag_name }}` <sup><a href="#top"><i class="fa fa-angle-double-up"></i></a></sup>

{% for post in site.tags[tag_name] %}
* {{ post.date | date_to_string }} &supe; [ {{ post.title }} ]({{ post.url }})

{% endfor %}
{% endfor %}


<script>
var options = {
  valueNames: [ 'tag' ]
};

var tagList = new List('tags', options);
tagList.sort('tag', { order: "asc" });
</script>
<style type="text/css">
  .list {
    list-style: none;
    padding: 0;
    text-align: justify;
  }
  .list li {
    display: inline-block;
    margin: 0 0.5rem 0 0;
  }
  .sort {
    background-color:#ac4142;
    display:inline-block;
    cursor:pointer;
    color:#ffffff;
    font-size: 1rem;
    padding:6px 15px;
    border:0;
    margin-bottom: 1rem;
  }
  .sort:hover {
    background-color:#ac4142;
  }
  .sort:active {
    position:relative;
    top:1px;
  }
  .search {
    font-size: 1rem;
  }
</style>
