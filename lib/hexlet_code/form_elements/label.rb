# frozen_string_literal: true

# Form <label> tag generator
class Label
  TAG_NAME = 'label'

  def self.build(field)
    label = {}
    label[:name] = TAG_NAME
    label[:attributes] = { for: field }
    label[:content] = field.capitalize.to_s
    label
  end
end
