---
layout: page
permalink: demo-iframe-containers/
hide-page: true
comments: false
use-math: false
use-pswp: false
use-jquery: false
title: Demo Page&#58; iframe Containers
---

##Google Maps Container

<div class="mapContainer">
  <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d37117.37047820854!2d-122.90857069939362!3d50.10410773648331!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e1!3m2!1sen!2sus!4v1441119013585" width="700" height="350" frameborder="0" style="border:0" allowfullscreen>
  </iframe>
</div>

###Caveats

The container has `height: 0`, and uses `padding-bottom: 50%;` to set the actual size of the content. The amount of padding is calculated by the width-to-height ratio of your desired `iframe` dimension.

###Code

	<style>
	.mapContainer {
	    position: relative;
	    padding-bottom: 50%;
	    padding-top: 0;
	    height: 0;
	    overflow: hidden;
	}
	.mapContainer iframe {
	    position: absolute;
	    top:0;
	    left: 0;
	    width: 100%;
	    height: 100%;
	}
	</style>
	<div class="mapContainer">
	  <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d37117.37047820854!2d-122.90857069939362!3d50.10410773648331!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e1!3m2!1sen!2sus!4v1441119013585" width="700" height="350" frameborder="0" style="border:0" allowfullscreen>
	  </iframe>
	</div>

