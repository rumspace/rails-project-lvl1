# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "hexlet_code"

require "minitest/autorun"
require "minitest-power_assert"

module TestHelper
  def self.load_test_fixtures
    path_fixtures = "#{File.dirname(__FILE__)}/fixtures"
    fixtures = []
    fixtures << File.read("#{path_fixtures}/html_test_form1.txt").delete("\r\n")
    fixtures << File.read("#{path_fixtures}/html_test_form2.txt").delete("\r\n")
    fixtures << File.read("#{path_fixtures}/html_test_form_input1.txt").delete("\r\n")
    fixtures << File.read("#{path_fixtures}/html_test_form_input2.txt").delete("\r\n")
  end
end
