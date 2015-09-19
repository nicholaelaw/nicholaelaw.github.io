---
layout: page
permalink: tengwar-reference/
comments: false
no-excerpt: false
use-math: false
use-pswp: false
use-jquery: false
hide-page: true
title: Tengwar Reference Page
---

## <span class="ta ta-bd">yj$ztÈ^ = e7\`B\`V2P -</span><!-- Welcome, friend -->

The following is a set of keyboard mapping of Tengwar Annatar font to latin letters. The keyboard layout is MacBook Pro international. Since OS X provides extra symbol input via <kbd>alt</kbd> and <kbd>alt</kbd><kbd>shift</kbd> modifiers, those symbols are also mapped out. For Windows, you have the alt-code at your disposal. Those tengwar and tehtar that were not available on the keyboard are listed in tables.

<style>
kbd.fw {
  width: 2rem;
  margin: 0 0.02rem 0.15rem 0;
}
div.kbdContainer {
  white-space: nowrap;
  overflow: scroll;
  border: 1px solid LightGray;
  border-radius: 5px;
  padding: 5px;
  max-width: 33rem;
}
code.tiny {
  color: Gray;
}
</style>


### Keyboard: Normal Case

<div class="kbdContainer">
{% for key in site.data.tnganMap.lowerCase %}
{% if key.name == 'q' %}<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{% endif %}{% if key.name == 'a' %}<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{% endif %}{% if key.name == 'z' %}<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{% endif %}<kbd class="fw">{{key.name}}<br><span class="ta ta-hl"><span style="color: gray;">{{key.pre|escape_once}}</span>{{key.value|escape_once}}</span></kbd>{% endfor %}
</div>

### Keyboard: Shift Case

<div class="kbdContainer">
{% for key in site.data.tnganMap.upperCase %}
{% if key.name == 'Q' %}<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{% endif %}{% if key.name == 'A' %}<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{% endif %}{% if key.name == 'Z' %}<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{% endif %}<kbd class="fw">{{key.name}}<br><span class="ta ta-hl"><span style="color: gray;">{{key.pre|escape_once}}</span>{{key.value|escape_once}}</span></kbd>{% endfor %}
</div>
<br>

### Keyboard: Alt Case

<div class="kbdContainer">
{% for key in site.data.tnganMap.altCase %}
{% if key.name == 'q' %}<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{% endif %}{% if key.name == 'a' %}<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{% endif %}{% if key.name == 'z' %}<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{% endif %}<kbd class="fw">{{key.name}}<br><span class="ta ta-hl"><span style="color: gray;">{{key.pre|escape_once}}</span>{{key.value|escape_once}}</span></kbd>{% endfor %}
</div>
<br>

### Keyboard: Alt-Shift Case

<div class="kbdContainer">
{% for key in site.data.tnganMap.altShiftCase %}
{% if key.name == 'Q' %}<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{% endif %}{% if key.name == 'A' %}<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{% endif %}{% if key.name == 'Z' %}<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{% endif %}<kbd class="fw">{{key.name}}<br><span class="ta ta-hl"><span style="color: gray;">{{key.pre|escape_once}}</span>{{key.value|escape_once}}</span></kbd>{% endfor %}
</div>
<br>

### The Awkward One

Since all the usual tengwar are mapped onto the keyboard, this one tengwa has nowhere to go: <kbd style="width: 1.8rem;">&#189;</kbd>&nbsp;&nbsp;&nbsp;<span class="ta ta-hl"><span style="color: gray;"></span>&#189;</span>&nbsp;&nbsp;&nbsp;<code class="tiny">&#38;#189;</code>

### Tehtar above and below Tengwar

<div style="overflow: scroll; max-width: 33rem;">
<table>
  <tbody>
  	<tr style="white-space: nowrap;">{% for key in site.data.tnganMap.tehtar %}<td style="text-align: center"><kbd style="width: 1.8rem;">{{key.name}}</kbd><div class="ta ta-hl" style="display: inline-block; width: 1.7rem;"><span style="color: gray;">{{key.pre}}</span>{{key.value}}</div><code class="tiny">{{key.name|escape}}</code></td>{% assign i = forloop.index|modulo:4 %}{% if i == 0 %}</tr><tr style="white-space: nowrap;">{% endif %}{% endfor %}</tr>
  </tbody>
</table>
</div>

### Bars and Tildes

<div style="overflow: scroll; max-width: 33rem;">
<table>
  <tbody>
  	<tr style="white-space: nowrap;">{% for key in site.data.tnganMap.bars-tildes %}<td style="text-align: center"><kbd style="width: 1.8rem;">{{key.name}}</kbd><div class="ta ta-hl" style="display: inline-block; width: 1.7rem;"><span style="color: gray;">{{key.pre}}</span>{{key.value}}</div><code class="tiny">{{key.name|escape}}</code></td>{% assign i = forloop.index|modulo:4 %}{% if i == 0 %}</tr><tr style="white-space: nowrap;">{% endif %}{% endfor %}</tr>
  </tbody>
</table>
</div>

### S-Hooks

<div style="overflow: scroll; max-width: 33rem;">
<table>
  <tbody>
  	<tr style="white-space: nowrap;">{% for key in site.data.tnganMap.s-hooks %}<td style="text-align: center"><kbd style="width: 1.8rem;">{{key.name}}</kbd><div class="ta ta-hl" style="display: inline-block; width: 1.7rem;"><span style="color: gray;">{{key.pre}}</span>{{key.value}}</div><code class="tiny">{{key.name|escape}}</code></td>{% assign i = forloop.index|modulo:4 %}{% if i == 0 %}</tr><tr style="white-space: nowrap;">{% endif %}{% endfor %}</tr>
  </tbody>
</table>
</div>

### Punctuations and Ornamentals

<div style="overflow: scroll; max-width: 33rem;">
<table>
  <tbody>
  	<tr style="white-space: nowrap;">{% for key in site.data.tnganMap.punctuations-ornamentals %}<td style="text-align: center"><kbd style="width: 1.8rem;">{{key.name}}</kbd><div class="ta ta-hl" style="display: inline-block; width: 1.7rem;"><span style="color: gray;">{{key.pre}}</span>{{key.value}}</div><code class="tiny">{{key.name|escape}}</code></td>{% assign i = forloop.index|modulo:4 %}{% if i == 0 %}</tr><tr style="white-space: nowrap;">{% endif %}{% endfor %}</tr>
  </tbody>
</table>
</div>

### Numerals

<div style="overflow: scroll; max-width: 33rem;">
<table>
  <tbody>
    <tr style="white-space: nowrap;"><td style="text-align: center"><kbd style="width: 1.8rem;">&#240;</kbd><div class="ta ta-hl" style="display: inline-block; width: 1.7rem;"><span style="color: gray;"></span>&#240;</div><code class="tiny">&amp;#240;</code></td></tr>
  	<tr style="white-space: nowrap;">{% for key in site.data.tnganMap.numerals %}<td style="text-align: center"><kbd style="width: 1.8rem;">{{key.name}}</kbd><div class="ta ta-hl" style="display: inline-block; width: 1.7rem;"><span style="color: gray;">{{key.pre}}</span>{{key.value}}</div><code class="tiny">{{key.name|escape}}</code></td>{% assign i = forloop.index|modulo:4 %}{% if i == 0 %}</tr><tr style="white-space: nowrap;">{% endif %}{% endfor %}</tr>
  </tbody>
</table>
</div>

### Rare Ones 

<div style="overflow: scroll; max-width: 33rem;">
<table>
  <tbody>
  	<tr style="white-space: nowrap;">{% for key in site.data.tnganMap.rare %}<td style="text-align: center"><kbd style="width: 1.8rem;">{{key.name}}</kbd><div class="ta ta-hl" style="display: inline-block; width: 1.7rem;"><span style="color: gray;">{{key.pre}}</span>{{key.value}}</div><code class="tiny">{{key.name|escape}}</code></td>{% assign i = forloop.index|modulo:4 %}{% if i == 0 %}</tr><tr style="white-space: nowrap;">{% endif %}{% endfor %}</tr>
  </tbody>
</table>
</div>

