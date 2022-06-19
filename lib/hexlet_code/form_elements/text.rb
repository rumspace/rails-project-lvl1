# frozen_string_literal: true

require_relative '../tag'

# Form <textarea> tag generator
class Text
  TAG_NAME = 'textarea'
  COLS_DEFAULT = 50
  ROWS_DEFAULT = 50

  def self.build(field, value, options)
    Tag.build(TAG_NAME, cols: options[:cols] || COLS_DEFAULT, rows: options[:rows] || ROWS_DEFAULT, name: field) do
      value
    end
  end
end
