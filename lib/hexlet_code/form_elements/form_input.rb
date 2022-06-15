# frozen_string_literal: true

require_relative "../tag"

# Form <input> tag generator
class FormInput
  def self.build(field, value, class_name = nil)
    Tag.build("input", name: field, type: "text", value: value, class: class_name)
  end
end
