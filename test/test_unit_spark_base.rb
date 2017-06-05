require "helper"
require "jekyll/spark"

class SparkComponentBase < JekyllUnitTest
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
