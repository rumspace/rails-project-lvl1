# frozen_string_literal: true

require_relative "../tag"

# Form <textarea> tag generator
class FormTextarea
  def self.build(field, value, cols = nil, rows = nil)
    "#{Tag.build("textarea", cols: cols || 50, rows: rows || 50, name: field)}#{value}#{Tag.build("/textarea")}"
  end
end
