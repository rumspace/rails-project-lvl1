# frozen_string_literal: true

require_relative "../tag"

# Form <textarea> tag generator
class FormTextarea
  def self.build(field, value, cols = 50, rows = 50)
    "#{Tag.build("textarea", cols: cols, rows: rows, name: field)}#{value}#{Tag.build("/textarea")}"
  end
end
