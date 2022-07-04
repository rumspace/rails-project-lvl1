# frozen_string_literal: true

require_relative 'tag'

# Generator of form fields
class FieldGenerator
  def self.setup_autoload
    autoload(:Label, 'hexlet_code/form_elements/label.rb')
    autoload(:Submit, 'hexlet_code/form_elements/submit.rb')
    autoload(:Input, 'hexlet_code/form_elements/input.rb')
    autoload(:Text, 'hexlet_code/form_elements/text.rb')
  end

  attr_accessor :fields

  def initialize(entity)
    self.class.setup_autoload

    @entity = entity
    @fields = []
  end

  def element(symbol)
    self.class.const_get(symbol.capitalize)
  end

  def input(field, options = {})
    label(field)
    @fields << element(options[:as] || :input).build(field, @entity.public_send(field), options)
  end

  def label(field)
    @fields << element(:label).build(field)
  end

  def submit(value = 'Save')
    @fields << element(:submit).build(value)
  end

  def generate_html
    fields_array = @fields.each_with_object([]) do |field, result|
      result << Tag.build(field[:name], field[:attributes]) { field[:content] }
    end
    fields_array.join
  end
end
