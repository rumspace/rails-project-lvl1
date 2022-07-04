# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test
  PATH_FIXTURES = "#{File.dirname(__FILE__)}/fixtures".freeze
  User = Struct.new(:name, :job, :gender, keyword_init: true)

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_form_for
    user = User.new name: 'rob'

    assert do
      HexletCode.form_for(user) == File.read("#{PATH_FIXTURES}/html_test_form_for1.html").delete("\r\n")
    end
    assert do
      HexletCode.form_for(user, url: '/users') == File.read("#{PATH_FIXTURES}/html_test_form_for2.html").delete("\r\n")
    end
  end

  def test_form_input
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'

    form_string = HexletCode.form_for user do |f|
      f.input :name
      f.input :job, as: :text, cols: 20, rows: 30
    end

    assert do
      form_string == File.read("#{PATH_FIXTURES}/html_test_form_input.html").delete("\r\n")
    end
  end

  def test_form_input_error
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'

    assert_raises(NoMethodError) do
      HexletCode.form_for user, url: '/users' do |f|
        f.input :name
        f.input :job, as: :text
        f.input :age # Поля age у пользователя нет
        f.submit
      end
    end
  end

  def test_form_submit
    user = User.new job: 'hexlet'

    form_string = HexletCode.form_for user do |f|
      f.input :name, class: 'user-input'
      f.input :job, as: :text
      f.submit
    end

    assert do
      form_string == File.read("#{PATH_FIXTURES}/html_test_form_form_label_submit.html").delete("\r\n")
    end
  end
end
