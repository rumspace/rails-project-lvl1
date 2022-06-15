# frozen_string_literal: true

require "test_helper"

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)

  def setup
    @fixtures = TestHelper.load_test_fixtures
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_form_for
    user = User.new name: "rob"

    assert do
      HexletCode.form_for(user) { |f| } == @fixtures[0]
    end
    assert do
      HexletCode.form_for(user, url: "/users") { |f| } == @fixtures[1]
    end
  end

  def test_form_input
    user = User.new name: "rob", job: "hexlet", gender: "m"

    form_string = HexletCode.form_for user do |f|
      f.input :name
      f.input :job, as: :text, cols: 20, rows: 30
    end
    assert { form_string == @fixtures[2] }
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
      f.input :name, class: "user-input"
      f.input :job, as: :text
      f.submit
    end

    assert { form_string == @fixtures[3] }
  end
end
