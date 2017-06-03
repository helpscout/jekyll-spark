require "jekyll"
require_relative "./base"

module Jekyll
  class ComponentBlock < Liquid::Block
    include Jekyll::ComponentBase
  end
end
