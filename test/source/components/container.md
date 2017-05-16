---
title: "Container"
type: "Component"
---

{% Container class: "pink-hot" %}
  <span class="text">
    Hot Pink
  </span>
  <div class="other">
    Alright
  </div>
  <style>
    .body {
      color: pink;
    }
  </style>
  <script>alert("wut");</script>
{% endContainer %}

{% Container class: "nested" %}

  {% Wistia id: "awesome" class: "awesome" %}

  <div class="o-row">
    <div class="o-col-4">
      {% img src: "001.png" class: "picture" %}
    </div>
    <div class="o-col-4">
      {% img src: "002.png" %}
    </div>
    <div class="o-col-4">
      {% img src: "003.png" %}
    </div>
  </div>

  {% Container class: "inner" %}
    {% WistiaPopover id: "pop" class: "pop" %}
      Popped!
    {% endWistiaPopover %}
  {% endContainer %}
{% endContainer %}
