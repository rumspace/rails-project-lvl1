# frozen_string_literal: true

require_relative 'tag'

# Generator of html forms
class FormGenerator
  def self.setup_autoload
    autoload(:Label, 'hexlet_code/form_elements/label.rb')
    autoload(:Submit, 'hexlet_code/form_elements/submit.rb')
    autoload(:Input, 'hexlet_code/form_elements/input.rb')
    autoload(:Text, 'hexlet_code/form_elements/text.rb')
  end

  attr_accessor :generated_tags

  def initialize(entity)
    self.class.setup_autoload

    @entity = entity
    @generated_tags = []
  end

  def element(symbol)
    self.class.const_get(symbol.capitalize)
  end

  def input(field, options = {})
    label(field)
    @generated_tags << element(options[:as] || :input).build(field, @entity.public_send(field), options)
  end

  def label(field)
    @generated_tags << element(:label).build(field)
  end

  def submit(value = 'Save')
    @generated_tags << element(:submit).build(value)
  end
end
