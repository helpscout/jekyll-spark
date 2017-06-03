require "jekyll-jet"

module Jekyll
  class ImageComponent < ComponentTag
    DEFAULT_TAG_PROPS = [
      "alt",
      "crossorigin",
      "id",
      "ismap",
      "longdesc",
      "style",
      "title",
      "usemap",
    ]
    BLANK_IMG = "data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="

    def template(context)
      prop = @props

      blazy_class_name = "b-lazy"
      class_name = prop["class"]
      height = prop["height"]
      data_src = BLANK_IMG
      src = prop["src"]
      srcset = prop["srcset"]
      title = prop["title"]
      width = prop["width"]
      responsive = ""
      default_props = selector_props(DEFAULT_TAG_PROPS)

      # Responsive
      # Adds new responsive-based image attributes: srcset and sizes.
      # The numbers are based on @attribute["width"].
      # At the moment, this plugin only supports 1x and 2x pixel-density sizes.
      #
      # Learn more about srcset
      # https://ericportis.com/posts/2014/srcset-sizes/
      #
      if srcset
        srcset_2x = srcset.to_s.gsub(/\.(?=[^.]*$)/, "@2x.")
        srcset_1x = srcset.to_s.gsub(/\.(?=[^.]*$)/, "@1x.")
        # Width-based srcset (Recommended)
        if (width)
          # Ensure that width is just a number (just in case)
          w = width.to_s.gsub("px", "").gsub("%", "").to_i
          responsive = "
            srcset='
              #{srcset_1x} #{w}w,
              #{srcset_2x} #{w*2}w
            '
          "
          responsive += "
            sizes='
              (min-width: 40em) #{w}px,
              100vw
            '
          "
        # Fallback to pixel-density based (if width is not available)
        else
          responsive = "
            srcset='
              #{srcset_1x} 1x,
              #{srcset_2x} 2x
            '
          "
        end
        src = srcset_1x
      end

      # Set the src for <noscript>. This is important since {% img %} uses
      # JS lazy-loading by default.
      noscript_src = src

      # Non-lazy load
      if (
        prop["lazy"] === false or
        prop["lazy"] === "false" or
        prop["skip_lazy"] === true or
        prop["skip_lazy"] === "true"
      )
        blazy_class_name = "b-skipped"
        data_src = ""
        src = src
      else
        data_src = src
        src = BLANK_IMG
      end

      render = "
        <img
          class='#{blazy_class_name} #{class_name}'
          data-src='#{data_src}'
          height='#{height}'
          src='#{src}'
          width='#{width}'
          #{responsive}
          #{default_props}
        />
      "
      unless(prop["skip_noscript"])
        # Add the <noscript> image for lazy-loaded images.
        if (src === BLANK_IMG)
          render += "
            <noscript>
              <img
                class='#{class_name}'
                height='#{height}'
                src='#{noscript_src}'
                width='#{width}'
                #{responsive}
                #{default_props}
              />
            </noscript>
          "
        end
      end

      return render
    end
  end
end

Liquid::Template.register_tag('Image', Jekyll::ImageComponent)
# Aliases
Liquid::Template.register_tag('img', Jekyll::ImageComponent)
