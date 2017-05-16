require "helper"

class ContainerComponent < JekyllUnitTest
  should "render inner HTML tag(s) and content" do
    markup = get_component_page("Container")
    doc = Nokogiri::HTML(markup)
    o = doc.css(".pink-hot")[0]
    t = doc.css(".text")[0]
    script = doc.css("script")[0]
    style = doc.css("style")[0]

    assert(o)
    assert(t.text.downcase.include?("hot pink"))
    assert(script)
    assert(style)
  end

  should "render a series of inner components and HTML tags" do
    markup = get_component_page("Container")
    doc = Nokogiri::HTML(markup)
    o = doc.css(".nested")[0]
    wistia = doc.css(".awesome")[0]
    pop = doc.css(".pop")[0]
    inner = doc.css(".inner")[0]
    picture = doc.css(".picture")[0]
    img = doc.css("img")

    assert(o)
    assert(wistia)
    assert(pop)
    assert(inner)
    assert(picture)
    assert_equal(img.length, 6)
  end
end
