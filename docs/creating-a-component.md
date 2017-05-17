# Creating a component

## Tag

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
