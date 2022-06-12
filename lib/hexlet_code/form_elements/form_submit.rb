# frozen_string_literal: true

require_relative "../tag"

# Form <submit> tag generator
class FormSubmit
  def self.build(name)
    Tag.build("input", name: name, type: "submit", value: "Save")
  end
end
