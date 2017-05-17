# Creating a component

Let's create our first component under `_plugins/tags`.

We'll call it `napolean.rb`! Below is the [starting template](https://github.com/helpscout/jekyll-components/tree/master/examples) of any Jekyll Component:

```ruby
require "jekyll-components"

module Jekyll
  class NapoleanComponent < ComponentTag # Create your component class
    def template(context)
      render = %Q[
        # Put markup here!
      ]
    end
  end
end

Liquid::Template.register_tag(
  "Napolean", # Namespace your component
  Jekyll::NapoleanComponent, # Pass your newly created component class
)
```

### Rendering markup

Let's make this component render this GIF:

![Happy hands](https://media.giphy.com/media/9QbDWTcnq4wmc/giphy.gif)


```ruby
require "jekyll-components"

module Jekyll
  class NapoleanComponent < ComponentTag
    def template(context)
      render = %Q[
        <div class="napolean">
          <img src="https://media.giphy.com/media/9QbDWTcnq4wmc/giphy.gif">
        </div>
      ]
    end
  end
end

Liquid::Template.register_tag(
  "Napolean",
  Jekyll::NapoleanComponent,
)
```

To use our tag component, all we have to do is use `{% Napolean %}` in our Jekyll `.html` or `.md` file:

```html
Check out this component!
{% Napolean %}
```

That's it!


### Adding props

"Props" are data that we can pass to our component. For our example, let's provide the ability to adjust the width of our image as well as provide a caption:

```html
{% Napolean
  width: "300"
  caption: "Way to eat all the friggen chips Kip!"
%}
```

You can totally write everything in a single line (below). However, we recommend the above approach as it makes it much easier to add/remove/edit props.

```html
{% Napolean width: "300" caption: "Way to eat all the friggen chips Kip!" %}
```

In order to use our new `width` and `caption` props, we have to update our `template` method in our Napolean component. Prop data being passed to our component will be available in a `@prop` instance variable in our `.rb` file:

```ruby
require "jekyll-components"

module Jekyll
  class NapoleanComponent < ComponentTag
    def template(context)
      # Declare props as variables
      # Not necessary, but highly recommended
      caption = @props["caption"]
      width = @props["width"]

      render = %Q[
        <div class="napolean">
          <img src="https://media.giphy.com/media/9QbDWTcnq4wmc/giphy.gif" width="#{width}">
          #{caption}
        </div>
      ]
    end
  end
end

Liquid::Template.register_tag(
  "Napolean",
  Jekyll::NapoleanComponent,
)
```

The resulting compiled markup will be:

```html
<div class="napolean">
  <img src="https://media.giphy.com/media/9QbDWTcnq4wmc/giphy.gif" width="300">
  Way to eat all the friggen chips Kip!
</div>
```


### Syntax

Below is a comparison between some syntax differences between Jekyll Components (Ruby) and React (ES6 Javascript):

| Ruby | Javascript (React) | Description |
| --- | --- | --- |
| `@props["key"]` | `this.props.key` | Component prop data. |
| `render =` | `render() { return ... } ` | Outputting the component's markup. |
| `%Q[ ... ]` | `` `...` `` | String interpolation wrapper. |
| `#{var}` | `${var} ` | String interpolated variable. |



## Creating a block component

Let's say we want to update our component to be a block instead. It'll make it more intuitive to add caption. Maybe something like:

```html
{% Napolean width: "300" %}
  This tastes like the cow got into an onion patch.
{% endNapolean %}
```

It's pretty easy! The only thing we need to change in our `napolean.rb` file is the Class our component inherits from.

Before:
```ruby
class NapoleanComponent < ComponentTag
```

After:
```ruby
class NapoleanComponent < ComponentBlock
```


### That's it!

You've got the basics to create some awesome components in Jekyll.

![Yesssssssssssssssss](https://media.giphy.com/media/uTuLngvL9p0Xe/giphy.gif)
