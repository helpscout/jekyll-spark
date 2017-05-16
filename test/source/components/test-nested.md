---
title: "Test Nested"
type: "Component"
---

<div class="no-content">
{% TestNested %}{% endTestNested %}
</div>

<div class="basic">
{% TestNested %}
  Hello
{% endTestNested %}
</div>

<div class="recursive">
  {% TestNested %}
    {% TestNested %}
      Yo dawg…
    {% endTestNested %}
  {% endTestNested %}
</div>
