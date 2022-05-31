# frozen_string_literal: true

# Field generator for html forms
class FieldGenerator
  attr_accessor :generated_fields

  def initialize(data)
    @data = data
    @generated_fields = []
  end

  def input(field, as_optional = nil)
    # example output <input name="name" type="text" value="rob">
    # example output <textarea cols="20" rows="40" name="job">hexlet</textarea>
    if as_optional
      cols = 20
      rows = 40
      value = @data.public_send(field)
      @generated_fields << "\n\t<textarea cols=\"#{cols}\" rows=\"#{rows}\" name=\"#{field}\">#{value}</textarea>"
    else
      type = "text"
      value = @data.public_send(field)
      @generated_fields << "\n\t<input name=\"#{field}\" type=\"#{type}\" value=\"#{value}\">"
    end
  end
end
