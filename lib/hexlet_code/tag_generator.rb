# frozen_string_literal: true

# HTML tags generator
module TagGenerator
  def build(*params)
    # example input "input", type: "submit", value: "Save"
    # example output '<input type="submit" value="Save">'
    return nil if params.nil?

    tag = [params.shift]
    unless params.empty?
      tag.concat params.first.each_with_object([]) { |attribute, result|
                   result << "#{attribute.first}=\"#{attribute.last}\""
                 }
    end

    "<#{tag.join(" ")}>"
  end
end
