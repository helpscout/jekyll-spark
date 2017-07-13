require "helper"

class PropsComponent < JekyllUnitTest
  should "render with nil props" do
    @joule.site.data["props"] = Hash.new
    @joule.site.data["props"]["src"] = "hello.jpg"
    @joule.site.data["props"]["post"] = {
      "nope_title" => "Title"
    }

    @joule.render(%Q[
      {% assign thumb = site.data.props.src %}
      {% img
        src: thumb
        alt: post.title
        height: 196
        title: post.title
        width: 350
        skip_lazy: true
      %}
    ])

    el = @joule.find("img")

    assert_equal(el.prop("src"), "hello.jpg")
    assert_equal(el.prop("width"), "350")
    assert_equal(el.prop("height"), "196")
  end
end
