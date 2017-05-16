---
title: "Wistia Popover"
type: "Component"
text: "wut"
---

{% WistiaPopover id: "hello" class: "first" %}
  Hello
{% endWistiaPopover %}



{% WistiaPopover id: "linky" class: "linky" %}
  <a href="https://helpscout.net">Help Scout</a>
{% endWistiaPopover %}



{% WistiaPopover id: "linky" class: "eval" %}
  {% if page.text %}
    {{ page.text }}
  {% else %}
    Nope!
  {% endif %}
{% endWistiaPopover %}



{% WistiaPopover
  id: "mov123"
  class: "stylin"
  style: "display: inline-block"
%}
  <a class="text-link link-caret-right" href="#">Watch the video</a>
{% endWistiaPopover %}
