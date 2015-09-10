---
layout: page
permalink: demo-jquery-on-demand/
hide-page: true
comments: false
use-math: false
use-pswp: false
use-jquery: false
title: Demo Page&#58; jQuery on Demand
---

## Load jQuery if it is not present

<button type="button"
onclick="loadjQueryOnDemand()">
Check jQuery</button>
<p id="demo"></p>

<script type="text/javascript">
  function loadjQueryOnDemand() {
    var result;
    if (typeof jQuery == 'undefined') {
      result = "not detected. ";
      document.getElementById('demo').innerHTML = "jQuery is "+result+"Loading jQuery...";
      getScript("{{ site.baseurl }}/public/js/jquery/jquery-1.11.3.min.js", function() {
        foo();
      });
    }
    else {
      result = "already loaded!";
      document.getElementById('demo').innerHTML = "jQuery is "+result;
    }
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