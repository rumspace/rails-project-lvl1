# frozen_string_literal: true

require_relative "../tag"

# Form <label> tag generator
class FormLabel
  def self.build(field)
    "#{Tag.build("label", for: field)}#{field.capitalize}#{Tag.build("/label")}"
  end
end
