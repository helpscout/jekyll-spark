require "jekyll"
require_relative "./base"

module Jekyll
  class ComponentTag < Liquid::Tag
    include Jekyll::ComponentBase
  end
end
