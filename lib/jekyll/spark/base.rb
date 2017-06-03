require "htmlcompressor"
require "jekyll"
require "liquid"

module Jekyll
  module ComponentBase
    include Liquid::StandardFilters

    @@compressor = HtmlCompressor::Compressor.new({
      :remove_comments => true
    }).freeze

    def initialize(tag_name, markup, tokens)
      super

      @attributes = {}
      @context = false
      @context_name = self.name.to_s.gsub("::", "_").downcase
      @content = ''
      @default_selector_attr = []
      @props = Hash.new
      @site = false

      if markup =~ /(#{Liquid::QuotedFragment}+)?/
        # Parse parameters
        # Source: https://gist.github.com/jgatjens/8925165
        markup.scan(Liquid::TagAttributes) do |key, value|
          @attributes[key] = Liquid::Expression.parse(value)
        end
      else
        raise SyntaxError.new(options[:locale].t("errors.syntax.include".freeze))
      end
    end

    # blank?
    # Description: Override's Liquid's default blank checker. This allows
    # for templates to be used without passing inner content.
    def blank?
      false
    end

    def selector_default_props(attr = @default_selector_attr)
      template = ""
      attr.each { |prop|
        if @props.key?(prop)
          template += "#{prop}='#{@props[prop]}' "
        end
      }

      return template
    end

    def selector_data_props(attr = @attributes)
      template = ""
      attr.keys.each { |key|
        if key.include? "data"
          template += "#{key.gsub("_", "-")}='#{@props[key]}' "
        end
      }

      return template
    end

    def selector_props(attr = @default_selector_attr)
      template = ""
      template += selector_data_props
      template += selector_default_props(attr)

      return template
    end

    def set_props(props = Hash.new)
      @context[@context_name] = @props = @props.merge(props)
    end

    def serialize_data
      data = Hash.new
      @attributes["content"] = @content
      if @attributes.length
        @attributes.each do |key, value|
          val = @context.evaluate(value)
          data[key] = val
        end
      end

      return set_props(data)
    end

    def unindent(content)
      # Remove initial whitespace
      content.gsub!(/\A^\s*\n/, "")
      # Remove indentations
      if content =~ %r!^\s*!m
        indentation = Regexp.last_match(0).length
        content.gsub!(/^\ {#{indentation}}/, "")
      end

      return content
    end

    def render(context)
      @context = context
      @site = @context.registers[:site]
      @content = super
      serialize_data
      output = template(context)

      if (output.instance_of?(String))
        output = Liquid::Template.parse(output).render()
        output = @@compressor.compress(unindent(output))
      else
        output = ""
      end

      return output
    end

    def template(context = @context)
      return context
    end

  end
end
