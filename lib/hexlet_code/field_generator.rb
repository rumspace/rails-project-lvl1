# frozen_string_literal: true

# Field generator for html forms
class FieldGenerator
  attr_accessor :generated_fields

  def initialize(data)
    @data = data
    @generated_fields = []
  end

  def input(field, as_optional = nil)
    @generated_fields << label(field)
    if as_optional
      value = @data.public_send(field)
      @generated_fields << "\n<textarea cols=\"20\" rows=\"40\" name=\"#{field}\">#{value}</textarea>"
    else
      value = @data.public_send(field) ? " value=\"#{@data.public_send(field)}\"" : ""
      @generated_fields << "\n<input name=\"#{field}\" type=\"text\"#{value}>"
    end
  end

  def label(field)
    "\n<label for=\"#{field}\">#{field.capitalize}</label>"
  end

  def submit
    @generated_fields << "\n<input name=\"commit\" type=\"submit\" value=\"Save\">"
  end
end
