require "jekyll-components"

module Jekyll
  class WistiaComponent < ComponentTag
    def template(context)
      unless @props["id"]
        return context
      end

      id = @props["id"].gsub("wistia_", "").gsub("Wistia_", "")
      class_name = @props["class"]

      render = %Q[
        <script src='https://fast.wistia.com/embed/medias/#{id}.jsonp' async></script>
        <div class='wistia_responsive_padding #{class_name}' style='padding:56.25% 0 0 0;position:relative;'>
          <div class='wistia_responsive_wrapper' style='height:100%;left:0;position:absolute;top:0;width:100%;'>
            <div class='wistia_embed wistia_async_#{id} videoFoam=true' style='height:100%;width:100%'>
              &nbsp;
            </div>
          </div>
        </div>
      ]
    end
  end
end

Liquid::Template.register_tag('Wistia', Jekyll::WistiaComponent)
