# frozen_string_literal: true

# HTML tag generator
class Tag
  def self.build(*params)
    # example input: "input", type: "submit", value: "Save"
    # example output: '<input type="submit" value="Save">'
    return nil if params.nil?

    elements = [params.shift] # tag name

    unless params.empty?
      params = params.first
      elements.concat params.each_with_object([]) { |attribute, result|
                        result << "#{attribute.first}=\"#{attribute.last}\"" unless attribute.last.nil?
                      }
    end

    "<#{elements.join(' ')}>"
  end
end
