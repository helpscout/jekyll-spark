require "jekyll-components"

module Jekyll
  class ExampleBlockComponent < ComponentBlock
    def template(context)
      # Declare props as variables here
      content = @props["content"]

      # Output rendered markup
      render = %Q[
        <div class="component">
          #{content}
        </div>
      ]
    end
  end
end

Liquid::Template.register_tag(
  "ExampleBlock",
  Jekyll::ExampleBlockComponent,
)
