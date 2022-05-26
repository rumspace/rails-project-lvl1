# frozen_string_literal: true

# Module to include into object sended to a form_for method of HexletCode module.
module FormForMethods
  def input(field, as = nil)
    # Example output
    # <input name="name" type="text" value="rob">
    # <textarea cols="20" rows="40" name="job">hexlet</textarea>
    if as == :text
      cols = 20
      rows = 20
      value = public_send(field)
      "<textarea cols=\"#{cols}\" rows=\"40\" name=\"#{field}\">#{value}</textarea>"
    else
      type = "text"
      value = public_send(field)
      "<input name=\"#{field}\" type=\"#{type}\" value=\"#{value}\">"
    end
  end
end
