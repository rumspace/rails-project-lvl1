# frozen_string_literal: true

require "test_helper"

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)

  def setup
    TestHelper.read_fixtures
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_tag_build
    assert { HexletCode::Tag.build("br") == TestHelper.fixtures[0] }
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

  def test_input
    user = User.new name: "rob", job: "hexlet", gender: "m"

    form_string = HexletCode.form_for user do |f|
      f.input :name
      f.input :job, as: :text
    end
    result = "<form action=\"#\" method=\"post\">\n\t<input name=\"name\" type=\"text\" value=\"rob\">\n\t<textarea cols=\"20\" rows=\"40\" name=\"job\">hexlet</textarea>\n</form>"
    assert { form_string == result }

    assert_raises(NoMethodError) do
      HexletCode.form_for user, url: "/users" do |f|
        f.input :name
        f.input :job, as: :text
        f.input :age # Поля age у пользователя нет
        # f.submit
      end
    end
  end
end
