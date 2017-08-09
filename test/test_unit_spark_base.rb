require "helper"
require "jekyll/spark"

class SparkComponentBase < JekyllUnitTest
  should "have blank? return false for Liquid" do
    o = Object.new
    o.extend(Jekyll::ComponentBase)

    assert(!o.blank?)
  end

  class PropsMethod < JekyllUnitTest
    should "be able to set props" do
      o = Object.new
      o.extend(Jekyll::ComponentBase)

      h = Hash.new
      h["name"] = "Name"
      o.props = h

      assert_equal(o.props["name"], "Name")
    end

    should "handle null key/values" do
      o = Object.new
      o.extend(Jekyll::ComponentBase)
      o.props = Hash.new

      h = Hash.new
      h["name"] = "Name"
      h["nulls"]
      h["nil"] = nil

      o.set_props(h)

      assert_equal(o.props["name"], "Name")
    end
  end

  class TemplateMethod < JekyllUnitTest
    should "return context arg by default" do
      o= Struct.new(:foo).new
      class << o
        include Jekyll::ComponentBase
      end

      assert_equal(o.template("default"), "default")
    end
  end
end
