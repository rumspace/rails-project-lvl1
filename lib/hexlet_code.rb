# frozen_string_literal: true

require_relative "hexlet_code/version"

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

  def self.form_for(user, url = nil, &block)
    autoload(:FormForMethods, "form_for_methods.rb")
    # user.class.include(FormForMethods)

    action = url ? (url[:url]).to_s : "#"
    method = "post"

    form_string = ["<form", "action=\"#{action}\"", "method=\"#{method}\">"]
    form_string = form_string.join(" ")

    yield(FormForMethods)

    form_string.concat("\n</form>")
  end
end
