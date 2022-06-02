# frozen_string_literal: true

# Field generator for html forms
class FieldGenerator
  attr_accessor :generated_fields

  def initialize(data)
    @data = data
    @generated_fields = []
  end

  def input(field, as_optional = nil)
    label_string = "\n<label for=\"#{field}\">#{field.capitalize}</label>"

    if as_optional
      cols = 20
      rows = 40
      value = @data.public_send(field)
      @generated_fields << label_string
      @generated_fields << "\n<textarea cols=\"#{cols}\" rows=\"#{rows}\" name=\"#{field}\">#{value}</textarea>"
    else
      type = "text"
      value = @data.public_send(field)
      value_string = value ? " value=\"#{value}\"" : ""
      @generated_fields << label_string
      @generated_fields << "\n<input name=\"#{field}\" type=\"#{type}\"#{value_string}>"
    end
  end

  def submit
    @generated_fields << "\n<input name=\"commit\" type=\"submit\" value=\"Save\">"
  end
end
