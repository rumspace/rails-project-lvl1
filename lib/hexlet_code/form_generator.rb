# frozen_string_literal: true

require_relative 'tag'

# Generator of html forms
class FormGenerator
  attr_accessor :generated_fields

  def initialize(entity)
    setup_autoload

    @entity = entity
    @generated_fields = []
  end

  def setup_autoload
    autoload(:FormLabel, 'hexlet_code/form_elements/form_label.rb')
    autoload(:FormSubmit, 'hexlet_code/form_elements/form_submit.rb')
    autoload(:FormInput, 'hexlet_code/form_elements/form_input.rb')
    autoload(:FormTextarea, 'hexlet_code/form_elements/form_textarea.rb')
  end

  def open_form(url)
    action = url ? (url[:url]).to_s : '#'
    method = 'post'
    @generated_fields << [Tag.build('form', action: action, method: method)]
  end

  def label(field)
    FormLabel.build(field)
  end

  def input(field, options = {})
    @generated_fields << label(field)
    @generated_fields << if options[:as] == :text
                           FormTextarea.build(field, @entity.public_send(field), options[:cols] || nil,
                                              options[:rows] || nil)
                         else
                           FormInput.build(field, @entity.public_send(field) || nil, options[:class] || nil)
                         end
  end

  def submit(value = 'Save')
    @generated_fields << FormSubmit.build(value)
  end

  def close_form
    @generated_fields << Tag.build('/form')
  end
end
