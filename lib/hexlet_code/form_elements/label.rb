# frozen_string_literal: true

require_relative '../tag'

# Form <label> tag generator
class Label
  TAG_NAME = 'label'

  def self.build(field)
    Tag.build(TAG_NAME, for: field) { field.capitalize.to_s }
  end
end
