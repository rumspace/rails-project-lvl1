# frozen_string_literal: true

require "test_helper"

class TestHexletCode < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_string
    assert { HexletCode::Tag.build("br") == "<br>" }
    assert { HexletCode::Tag.build("img", src: "path/to/image") == "<img src=\"path/to/image\">" }
    assert { HexletCode::Tag.build("input", type: "submit", value: "Save") == "<input type=\"submit\" value=\"Save\">" }
  end
end
