# frozen_string_literal: true

# Form <input> tag generator
class Input
  TAG_NAME = 'input'
  TYPE = 'text'

  def self.build(field, value, options)
    input = {}
    input[:name] = TAG_NAME
    input[:attributes] = { name: field, type: TYPE, value: value, class: options[:class] || nil }
    input
  end
end
