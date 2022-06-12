# frozen_string_literal: true

require_relative "tag"

# Generator of html forms
class FormGenerator
  attr_accessor :generated_fields

  def initialize(entity)
    setup_autoload

    @entity = entity
    @generated_fields = []
  end

  def setup_autoload
    autoload(:FormLabel, "hexlet_code/form_elements/form_label.rb")
    autoload(:FormSubmit, "hexlet_code/form_elements/form_submit.rb")
    autoload(:FormInput, "hexlet_code/form_elements/form_input.rb")
    autoload(:FormTextarea, "hexlet_code/form_elements/form_textarea.rb")
  end

  def open_form(url)
    action = url ? (url[:url]).to_s : "#"
    method = "post"
    @generated_fields << [Tag.build("form", action: action, method: method)]
  end

  def label(field)
    FormLabel.build(field)
  end

  def input(field, type = nil)
    @generated_fields << label(field)
    if type.nil?
      @generated_fields << FormInput.build(field, @entity.public_send(field) || nil)
    else
      case type[:as]
      when :text
        @generated_fields << FormTextarea.build(field, @entity.public_send(field))
      end
    end
  end

  def submit(name = "commit")
    @generated_fields << FormSubmit.build(name)
  end

  def close_form
    @generated_fields << Tag.build("/form")
  end
end
