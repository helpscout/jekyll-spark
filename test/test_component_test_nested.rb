require "helper"

class TestNestedComponent < JekyllUnitTest
  should "render inner component tag and content" do
    markup = get_component_page("Test Nested")
    doc = Nokogiri::HTML(markup)
    div = doc.css(".basic div")[0]
    image = doc.css("img")[0]

    assert(div)
    assert(div.text.include?("Hello"))
    assert(image, "Renders inner {% img %} component")
  end

  should "render without content" do
    markup = get_component_page("Test Nested")
    doc = Nokogiri::HTML(markup)
    div = doc.css(".no-content div")[0]
    image = doc.css("img")[0]

    assert(div)
    assert(image, "Renders inner {% img %} component")
  end

  should "render inner recursive component block and content" do
    markup = get_component_page("Test Nested")
    doc = Nokogiri::HTML(markup)
    div = doc.css(".recursive")[0]
    img = doc.css("img")[0]
    repeat = doc.css(".c-test-nested .c-test-nested")

    assert(div)
    assert(img, "Renders inner {% img %} component")
    assert(repeat)
    assert(repeat.text.include?("Yo dawg"))
  end
end
