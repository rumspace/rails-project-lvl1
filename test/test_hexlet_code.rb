# frozen_string_literal: true

require "test_helper"

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)

  def setup
    @fixtures_tag = File.read("#{File.dirname(__FILE__)}/fixtures/html_test_tag.txt").split("\r\n")
    @fixture_form1 = File.read("#{File.dirname(__FILE__)}/fixtures/html_test_form1.txt").delete("\r")
    @fixture_form2 = File.read("#{File.dirname(__FILE__)}/fixtures/html_test_form2.txt").delete("\r")
    @fixture_form_input1 = File.read("#{File.dirname(__FILE__)}/fixtures/html_test_form_input1.txt").delete("\r")
    @fixture_form_input2 = File.read("#{File.dirname(__FILE__)}/fixtures/html_test_form_input2.txt").delete("\r")
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_tag_build
    assert { HexletCode::Tag.build("br") == @fixtures_tag[0] }
    assert { HexletCode::Tag.build("img", src: "path/to/image") == @fixtures_tag[1] }
    assert { HexletCode::Tag.build("input", type: "submit", value: "Save") == @fixtures_tag[2] }
  end

  def test_form_for
    user = User.new name: "rob"

    assert do
      HexletCode.form_for(user) { |f| } == @fixture_form1
    end
    assert do
      HexletCode.form_for(user, url: "/users") { |f| } == @fixture_form2
    end
  end

  def test_form_input
    user = User.new name: "rob", job: "hexlet", gender: "m"

    form_string = HexletCode.form_for user do |f|
      f.input :name
      f.input :job, as: :text
    end
    assert { form_string == @fixture_form_input1 }
  end

  def test_form_input_error
    user = User.new name: "rob", job: "hexlet", gender: "m"

    assert_raises(NoMethodError) do
      HexletCode.form_for user, url: "/users" do |f|
        f.input :name
        f.input :job, as: :text
        f.input :age # Поля age у пользователя нет
        f.submit
      end
    end
  end

  def test_form_label_submit
    user = User.new job: "hexlet"

    form_string = HexletCode.form_for user do |f|
      f.input :name
      f.input :job
      f.submit
    end

    assert { form_string == @fixture_form_input2 }
  end
end
