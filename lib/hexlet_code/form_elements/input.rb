# frozen_string_literal: true

require_relative '../tag'

# Form <input> tag generator
class Input
  TAG_NAME = 'input'
  TYPE = 'text'

  def self.build(field, value, options)
    Tag.build(TAG_NAME, name: field, type: TYPE, value: value, class: options[:class] || nil)
  end
end
