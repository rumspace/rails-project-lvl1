# frozen_string_literal: true

require_relative "hexlet_code/version"
require_relative "form_for_methods"

# DSL form generator
module HexletCode
  class Error < StandardError; end

  # Form generator for tags
  class Tag
    def self.build(*params)
      return nil if params.nil?

      tag_string = [params.shift]
      unless params.empty?
        tag_string.concat params.first.each_with_object([]) { |attribute, result|
                            result << "#{attribute.first}=\"#{attribute.last}\""
                          }
      end

      "<#{tag_string.join(" ")}>"
    end
  end

  def self.form_for(_user, url = nil)
    # autoload(:FormForMethods, "form_for_methods.rb")
    # user.class.include(FormForMethods)

    # class user.class
    #   def input(field, as = nil)
    #     # Example output
    #     # <input name="name" type="text" value="rob">
    #     # <textarea cols="20" rows="40" name="job">hexlet</textarea>
    #     if as == :text
    #       cols = 20
    #       rows = 20
    #       value = public_send(field)
    #       "<textarea cols=\"#{cols}\" rows=\"40\" name=\"#{field}\">#{value}</textarea>"
    #     else
    #       type = "text"
    #       value = public_send(field)
    #       "<input name=\"#{field}\" type=\"#{type}\" value=\"#{value}\">"
    #     end
    #   end
    # end

    action = url ? (url[:url]).to_s : "#"
    method = "post"

    form_string = ["<form", "action=\"#{action}\"", "method=\"#{method}\">"]
    form_string = form_string.join(" ")

    yield

    form_string.concat("\n</form>")
  end
end
