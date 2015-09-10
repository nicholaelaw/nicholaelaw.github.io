---
layout: page
permalink: demo-jquery-on-demand/
hide-page: true
comments: false
use-math: false
use-pswp: true
use-jquery: false
title: Demo Page&#58; jQuery on Demand
---

## Load jQuery if it is not present

jQuery detection and loading mechanism stolen shamelessly from [a CSS-Tricks article](https://css-tricks.com/snippets/jquery/load-jquery-only-if-not-present/){:target="_blank"}, and adapted to my own purposes.

<button type="button" onclick="loadjQueryOnDemand()">Check jQuery</button>

<p id="demo"></p>


## QR tooltip on Demand

Next, try to slap my QR tooltip onto that button, and load necessary files. Click the above button first, see that jQuery isn't loaded. Then click this button again to generate a QR code, which requires jQuery and another two plugins to work. At last click the above button again to see that jQuery is indeed loaded.

<a onclick="QRshare()" id="QRshare" title="<div id='qrcode' style='width: 256px; height: 260px;'><img src='/assets/images/qrbackground.png'/></div><figcaption style='text-align: center;'><i class='fa fa-arrow-up'></i>用手机扫一扫<i class='fa fa-arrow-up'></i></figcaption>"><i class="fa fa-qrcode fa-2x" ></i></a>

The tooltip complicates things a lot. In order for it to "just work", so that the user will not notice anything or have to do anything besides clicking once, a number of things need to happen:

1. Determine if jQuery is loaded;
2. Determine if tooltipster and qrcode is loaded;
3. Either load tooltipster and qrcode or load jQuery then tooltipster and qrcode;
4. Additionally, tooltipster CSS has to be loaded as well;
5. Make the QR tooltip, and stop the script from being executed again;

Here is a flowchart, made with the excellent [Lucidhart](https://www.lucidchart.com/){:target="_blank"}:

<div class="imgDisplay monod" style="max-width: 600px" itemscope itemtype="http://schema.org/ImageGallery">
  <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
  <a href="/assets/images/QRtip-on-demand-flowchart-750x1506.png" itemprop="contentUrl" data-size="750x1506" >
  <img src="/assets/images/QRtip-on-demand-flowchart-750x1506.png" itemprop="thumbnail" 
    title="Note that jQuery is assumed if tooltipster and qrcode is present." 
    alt="Note that jQuery is assumed if tooltipster and qrcode is present." /></a>
  <figcaption itemprop="caption description">Note that jQuery is assumed if tooltipster and qrcode is present.</figcaption>
  </figure>
</div>

Note there is an assumption made in this process: if tooltipster and qrcode are present, we do not check for jQuery's presence. This is because both tooltipster and qrcode are jQuery plugins and they would not work without jQuery. So it is assumed that whenever a page preloads tooltipster and qrcode, it would load jQuery before the plugins (switch `use-jquery` is set to `true`). The dependency is not checked by the system and is the responsibility of the author (in this case, me). If somehow the plugins were loaded without jQuery preceding them, an error would be logged in the console and the contraption would not work.

So there I've done it. I crammed two functions into one button. When clicked for the first time, it loads necessary scripts to make a QR tooltip. Then it would alter its own onclick property, to change its function into showing the tooltip and to prevent initialize again. 

<script type="text/javascript">
  function QRshare() {
    if (typeof tooltipster == 'undefined') {
      if (typeof jQuery == 'undefined') {
        // Load jQuery and then QR code and Tooltipster
        getScript("{{ site.baseurl }}/public/js/jquery/jquery-1.11.3.min.js", function() {
          getScript("{{ site.baseurl }}/public/js/jquery-tooltipster-qrcode-bundle.min.js", function() {
            $('<link>').appendTo('head').attr({type : 'text/css', rel : 'stylesheet'})
              .attr('href', '{{ site.baseurl }}/public/css/tooltipster-bundle.min.css');
            makeQRTip();
            return false;
          });
        });
      }
      else {
        // Load QR code and tooltipster
        getScript("{{ site.baseurl }}/public/js/jquery-tooltipster-qrcode-bundle.min.js", function() {
          $('<link>').appendTo('head').attr({type : 'text/css', rel : 'stylesheet'})
            .attr('href', '{{ site.baseurl }}/public/css/tooltipster-bundle.min.css');
          makeQRTip();
          return false;
        });
      }
    }
    else {
      // Make QR tooltip
      makeQRTip();
      return false;
    }
  }

  function makeQRTip() {
    $('#QRshare').tooltipster({
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
    $('#QRshare').tooltipster('show', function() {
      $("#QRshare").attr("onclick","return false");
    })
  }

  function loadjQueryOnDemand() {
    var result;
    if (typeof jQuery == 'undefined') {
      result = "not detected. ";
    }
    else {
      result = "already loaded!";
    }
    document.getElementById('demo').innerHTML = "jQuery is "+result;
  }

  function foo() {
    $("#demo").append("<br><br>Now jQuery is loaded!");
  }

  function getScript(url, success) {
    var script = document.createElement('script');
        script.src = url;
    var head = document.getElementsByTagName('head')[0],
        done = false;
    // Attach handlers for all browsers
    script.onload = script.onreadystatechange = function() {
      if (!done && (!this.readyState || this.readyState == 'loaded' || this.readyState == 'complete')) {
      done = true;
        // callback function provided as param
        success();
        script.onload = script.onreadystatechange = null;
        head.removeChild(script)
      }
    }
    head.appendChild(script);
  }
</script>