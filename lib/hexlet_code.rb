# frozen_string_literal: true

require_relative 'hexlet_code/version'

# DSL form generator
module HexletCode
  class Error < StandardError; end

  # form generator
  def self.form_for(user, url = nil)
    autoload(:FieldGenerator, 'hexlet_code/field_generator.rb')
    field_generator = FieldGenerator.new(user)

    tag_name = 'form'
    action = url ? (url[:url]).to_s : '#'
    method = 'post'
    Tag.build(tag_name, action: action, method: method) do
      yield(field_generator) if block_given?
      field_generator.generate_html
    end
  end
end
