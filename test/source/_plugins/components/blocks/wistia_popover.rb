require "jekyll-components"

module Jekyll
  class WistiaPopoverComponent < ComponentBlock
    def template(context)
      unless @props["id"]
        return context
      end

      id = @props["id"].gsub("wistia_", "").gsub("Wistia_", "")
      class_name = @props["class"]
      content = @props["content"]
      style = @props["style"] || "display:inline-block;height:80px;width:150px"

      render = %Q[
        <span class="c-wistia-popover">
          <script src="https://fast.wistia.com/embed/medias/#{id}.jsonp" async></script>
          <span
            class="
              wistia_embed wistia_async_#{id}
              popover=true popoverAnimateThumbnail=true
              #{class_name}
            "
            style="#{style}"
          >
            #{content}
          </span>
        </span>
      ]
    end
  end
end

Liquid::Template.register_tag('WistiaPopover', Jekyll::WistiaPopoverComponent)
