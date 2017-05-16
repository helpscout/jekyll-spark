require "helper"

class WistiaComponent < JekyllUnitTest
  should "generate an async Wistia embed code with an ID" do
    markup = get_component_page("Wistia")
    doc = Nokogiri::HTML(markup)
    script = doc.css(".default script")[0]
    embed = doc.css(".default .wistia_embed")[0]

    assert(script)
    assert(script.key?("async"))
    assert(script["src"].include?("jsonp"), "Has jsonp callback")
    assert(embed)
  end

  should "correctly be parsed by markdown" do
    markup = get_component_page("Wistia Markdown")
    doc = Nokogiri::HTML(markup)
    script = doc.css("script")[0]
    embed = doc.css(".wistia_embed")[0]

    assert(script)
    assert(embed)
    assert(!doc.css("code")[0])
    assert(!doc.css(".highlighter-rouge")[0])
  end

  should "not generate an embed without an ID" do
    markup = get_component_page("Wistia")
    doc = Nokogiri::HTML(markup)
    script = doc.css(".nope script")[0]
    embed = doc.css(".nope .wistia_embed")[0]

    assert(!script)
    assert(!embed)
  end

  should "strip wistia- (hyphen) from the ID" do
    markup = get_component_page("Wistia")
    doc = Nokogiri::HTML(markup)
    script = doc.css(".wistia-hyphen-id script")[0]

    assert(!script["src"].include?("wistia-"))
  end

  should "strip wistia_ (underscore) from the ID" do
    markup = get_component_page("Wistia")
    doc = Nokogiri::HTML(markup)
    script = doc.css(".wistia-underscore-id script")[0]

    assert(!script["src"].include?("wistia_"))
  end
end
