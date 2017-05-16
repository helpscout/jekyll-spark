require "jekyll-components"

module Jekyll
  class TestNestedComponent < ComponentBlock
    def template(context)
      content = @props["content"]

      render = %Q[
        <div class="c-test-nested">
          {% img
            src: "test.jpg"
          %}
          #{content}
        </div>
      ]
    end
  end
end

Liquid::Template.register_tag(
  "TestNested",
  Jekyll::TestNestedComponent,
)
