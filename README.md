# jekyll-components 🌟 [![Build Status](https://travis-ci.org/helpscout/jekyll-components.svg?branch=master)](https://travis-ci.org/helpscout/jekyll-components) [![Gem Version](https://badge.fury.io/rb/jekyll-components.svg)](https://badge.fury.io/rb/jekyll-components)

A Jekyll library for building component-based UI

This library was heavily inspired by view/component creation from modern Javascript libraries like [React](https://facebook.github.io/react/) and [Vue](https://vuejs.org/).

**Table of Contents**

- [Install](#install)
- [Introduction](#introduction)
- [Creating a component](#creating-a-component)

## Install

Add this line to your application's Gemfile:

```ruby
gem 'jekyll-components'
```

And then execute:
```
bundle
```

Or install it yourself as:
```
gem install jekyll-components
```

## Introduction

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


## Creating a component

### Tag

Let's create our first component under `_plugins/tags`. We'll call it `napolean.rb`. Below is the starting template of any Jekyll Component:

```ruby
require "jekyll-components"

module Jekyll
  class NapoleanComponent < ComponentTag
    def template(context)
      render = %Q[
        # Put markup here!
      ]
    end
  end
end

Liquid::Template.register_tag(
  "Napolean",
  Jekyll::NapoleanComponent,
)
```
