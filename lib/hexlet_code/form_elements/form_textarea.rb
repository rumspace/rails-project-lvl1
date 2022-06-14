# frozen_string_literal: true

require_relative "../tag"

# Form <textarea> tag generator
class FormTextarea
  def self.build(field, value, cols = 20, rows = 40)
    # cols = 20
    # rows = 40
    "#{Tag.build("textarea", cols: cols, rows: rows, name: field)}#{value}#{Tag.build("/textarea")}"
  end
end
