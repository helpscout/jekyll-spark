require "helper"

class WistiaPopoverComponent < JekyllUnitTest
  should "generate an async Wistia popover embed code with an ID" do
    markup = get_component_page("Wistia Popover")
    doc = Nokogiri::HTML(markup)
    span = doc.css(".first")[0]

    assert(span)
    assert(span.text.downcase.include?("hello"))
    assert(span["class"].include?("wistia_async_hello"))
  end

  should "generate a block with markup-based content" do
    markup = get_component_page("Wistia Popover")
    doc = Nokogiri::HTML(markup)
    span = doc.css(".linky")[0]
    link = doc.css(".linky a")[0]

    assert(span)
    assert(span["class"].include?("wistia_async_linky"))
    assert(link)
    assert(link["href"].include?("helpscout.net"))
    assert(link.text.include?("Help Scout"))
  end

  should "render style prop" do
    markup = get_component_page("Wistia Popover")
    doc = Nokogiri::HTML(markup)
    span = doc.css(".stylin")[0]
    link = doc.css(".stylin a")[0]

    assert(span)
    assert(span["style"].include?("inline-block"))
    assert(link)
    assert(link["class"].include?("text-link"))
    assert(link["href"].include?("#"))
    assert(link.text.include?("video"))
  end

  should "evaluate variables within content" do
    markup = get_component_page("Wistia Popover")
    doc = Nokogiri::HTML(markup)
    span = doc.css(".eval")[0]

    assert(span)
    assert(span.text.include?("wut"))
  end
end
