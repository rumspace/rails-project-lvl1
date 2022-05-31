# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "hexlet_code"

require "minitest/autorun"
require "minitest-power_assert"

module TestHelper
  attr_accessor :fixtures

  def self.read_fixtures
    @@fixtures = File.read("fixtures/html_test_data.txt").split("\r\n")
  end
end
