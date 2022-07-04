# frozen_string_literal: true

# Form <textarea> tag generator
class Text
  TAG_NAME = 'textarea'
  COLS_DEFAULT = 50
  ROWS_DEFAULT = 50

  def self.build(field, value, options)
    text = {}
    text[:name] = TAG_NAME
    text[:attributes] = { cols: options[:cols] || COLS_DEFAULT, rows: options[:rows] || ROWS_DEFAULT, name: field }
    text[:content] = value
    text
  end
end
