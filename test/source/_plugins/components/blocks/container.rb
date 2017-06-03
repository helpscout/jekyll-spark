require "jekyll-jet"

module Jekyll
  class ContainerComponent < ComponentBlock
    def template(context)
      content = @props["content"]
      class_name = @props["class"]

      render = %Q[
        <div class="o-container #{class_name}">
          <div class="o-row">
            <div class="o-col-10@md o-col-offset-1@md">
              #{content}
            </div>
          </div>
        </div>
      ]
    end
  end
end

Liquid::Template.register_tag(
  "Container",
  Jekyll::ContainerComponent,
)
