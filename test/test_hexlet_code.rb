# frozen_string_literal: true

require "test_helper"

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, keyword_init: true)

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_tag_build
    assert { HexletCode::Tag.build("br") == "<br>" }
    assert { HexletCode::Tag.build("img", src: "path/to/image") == '<img src="path/to/image">' }
    assert { HexletCode::Tag.build("input", type: "submit", value: "Save") == '<input type="submit" value="Save">' }
  end

  def test_form_for
    user = User.new name: "rob"

    assert do
      HexletCode.form_for(user) { |f| } == "<form action=\"#\" method=\"post\">\n</form>"
    end
    assert do
      HexletCode.form_for(user, url: "/users") { |f| } == "<form action=\"/users\" method=\"post\">\n</form>"
    end
  end
end
