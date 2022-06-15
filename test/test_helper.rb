# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "hexlet_code"

require "minitest/autorun"
require "minitest-power_assert"

module TestHelper
  def self.load_test_fixtures
    path_fixtures = "#{File.dirname(__FILE__)}/fixtures"
    fixtures = []
    fixtures << File.read("#{path_fixtures}/html_test_form_for1.html").delete("\r\n")
    fixtures << File.read("#{path_fixtures}/html_test_form_for2.html").delete("\r\n")
    fixtures << File.read("#{path_fixtures}/html_test_form_input.html").delete("\r\n")
    fixtures << File.read("#{path_fixtures}/html_test_form_form_label_submit.html").delete("\r\n")
  end
end
