# Introduction

Components are `.rb` files that are added to your Jekyll project's default `_plugins/` directory:

```shell
my-jekyll/
└── _plugins/
    └── *Add components here*
```

There are two types are Components:

**Tags**

These components are created using Liquid [Tags](http://www.rubydoc.info/github/Shopify/liquid/Liquid/Tag), and they do not contain content when used.

Example:
```html
{% Napolean id: "skillz" class: "nunchucks bow staff computer-hacking" %}
```

**Blocks**

These components are created using Liquid [Blocks](http://www.rubydoc.info/github/Shopify/liquid/Liquid/Block), and they **do** contain content when used.

Example:
```html
{% Napolean class: "chapstick" %}
  But my lips hurt real bad!
{% endNapolean %}
```

Because of these types, we recommend you organize your components in your `_plugins/` directory into `tags` and `blocks` directories:

```shell
my-jekyll/
└── _plugins/
    ├── blocks/
    └── tags/
```


## Next

Learn how to [create a component](https://github.com/helpscout/jekyll-components/blob/master/docs/creating-a-component.md).
