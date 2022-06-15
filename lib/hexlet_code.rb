# frozen_string_literal: true

require_relative 'hexlet_code/version'

# DSL form generator
module HexletCode
  class Error < StandardError; end

  # form generator
  def self.form_for(user, url = nil)
    autoload(:FormGenerator, 'hexlet_code/form_generator.rb')

    form_generator = FormGenerator.new(user)
    form_generator.open_form(url)
    yield(form_generator) if block_given?
    form_generator.close_form
    form_generator.generated_fields.join('')
  end
end
