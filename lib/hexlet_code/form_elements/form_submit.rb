# frozen_string_literal: true

require_relative "../tag"

# Form <submit> tag generator
class FormSubmit
  def self.build
    Tag.build("input", name: "commit", type: "submit", value: "Save")
  end
end
