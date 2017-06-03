require "jekyll-spark"

module Jekyll
  class ExampleTagComponent < ComponentTag
    def template(context)
      # Declare props as variables here

      # Output rendered markup
      render = %Q[
        <div class="component">
          Example
        </div>
      ]
    end
  end
end

Liquid::Template.register_tag(
  "ExampleTag",
  Jekyll::ExampleTagComponent,
)
