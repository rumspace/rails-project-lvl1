# frozen_string_literal: true

require_relative "hexlet_code/version"

# DSL form generator
module HexletCode
  class Error < StandardError; end

  # HTML tags generator
  class Tag
    autoload(:TagGenerator, "hexlet_code/tag_generator.rb")
    extend TagGenerator
  end

  # form generator
  def self.form_for(user, url = nil)
    autoload(:FieldGenerator, "hexlet_code/field_generator.rb")

    action = url ? (url[:url]).to_s : "#"
    method = "post"
    form = [Tag.build("form", action: action, method: method)]

    field_generator = FieldGenerator.new(user)
    yield(field_generator) if block_given?

    form.concat(field_generator.generated_fields) unless field_generator.generated_fields.empty?
    form << ("\n</form>")
    form.join("")
  end
end
