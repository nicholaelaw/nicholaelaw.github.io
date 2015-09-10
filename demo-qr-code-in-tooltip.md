---
layout: page
permalink: demo-qr-code-in-tooltip/
hide-page: true
comments: false
use-math: false
use-pswp: false
use-jquery: true
title: Demo Page&#58; QR Code in a Tooltip
---
<!-- Activated scripts & CSS -->
<script type="text/javascript" src="/public/js/jquery-tooltipster-qrcode-bundle.min.js"></script>
<link rel="stylesheet" href="{{ site.baseurl }}/public/css/tooltipster-bundle.min.css"/>

## The Effect

A tooltip filled with a client-side generated QR code, which encodes current page URL. I created this as an experimental home-made sharing button.

Try it: <a href="#" onclick="return false;" id="sharebtn" title="<div id='qrcode' style='width: 256px; height: 260px;'><img src='/assets/images/qrbackground.png'/></div><figcaption>Scan the QR code on your mobile device!</figcaption>"><i class="fa fa-qrcode fa-2x" ></i></a>

<script>
  $(document).ready(function() {
    $('#sharebtn').tooltipster({
      theme: 'tooltipster-shadow',
      contentAsHTML: true,
      trigger: 'click',
      maxwidth: 256,
      functionReady: function() {
        $('#qrcode').empty().qrcode({
          width: 256,
          height: 256,
          text: window.location.href
        });
      }
    });
    //$('#sharebtn').tooltipster('reposition');
  });
</script>

## How to

Things used in this demo:

* [jQuery](https://jquery.com/){:target="_blank"};
* [jQuery Tooltipster plugin](http://iamceege.github.io/tooltipster/){:target="_blank"}
 for tooltip implementation;
* [jQuery QR code plugin](http://jeromeetienne.github.io/jquery-qrcode/){:target="_blank"} for client-side QR code generation;
* [Font Awesome](http://fontawesome.io/){:target="_blank"} for the icon.

Steps:

1. Create an object to have the tooltip;
2. Set the title of that object to the HTML code decribing a container, with specified size and optional caption;
3. Use Tooltipster to make a tooltip, set desired options, and in `functionReady` part EMPTY the container and call `qrcode` to put the code in it;
4. Profit!

## Caveats

Be sure to set the container and the tooltip to the correct size! Otherwise the tooltip will have positioning issues.

## The code:

	<a href="#" onclick="return false;" id="sharebtn" title="<div id='qrcode' style='width: 256px; height: 260px;'><img src='/assets/processing/qrbackground.png'/></div><figcaption>Scan the QR code on your mobile device!</figcaption>"><i class="fa fa-qrcode" ></i></a>

	<script>
	  $(document).ready(function() {
	    $('#sharebtn').tooltipster({
	      theme: 'tooltipster-shadow',
	      contentAsHTML: true,
	      trigger: 'click',
	      maxwidth: 256,
	      functionReady: function() {
	        $('#qrcode').empty().qrcode({
	          width: 256,
	          height: 256,
	          text: window.location.href
	        });
	      }
	    });
	    $('#sharebtn').tooltipster('reposition');
	  });
	</script>

