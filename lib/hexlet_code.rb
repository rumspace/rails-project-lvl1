# frozen_string_literal: true

require_relative 'hexlet_code/version'

# DSL form generator
module HexletCode
  class Error < StandardError; end

  # form generator
  def self.form_for(user, url = nil)
    autoload(:FormGenerator, 'hexlet_code/form_generator.rb')
    form_generator = FormGenerator.new(user)

    action = url ? (url[:url]).to_s : '#'
    method = 'post'
    Tag.build('form', action: action, method: method) do
      yield(form_generator) if block_given?
      form_generator.generated_tags.join
    end
  end
end
