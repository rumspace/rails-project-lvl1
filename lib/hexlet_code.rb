# frozen_string_literal: true

require_relative "hexlet_code/version"

# DSL form generator
module HexletCode
  class Error < StandardError; end

  # Form generator for tags
  class Tag
    def self.build(*params)
      return nil if params.nil?

      # HexletCode::Tag.build('input', type: 'submit', value: 'Save')
      # <input type="submit" value="Save">
      tag_string = [params.shift]
      unless params.empty?
        tag_string.concat params.first.each_with_object([]) { |attribute, result|
                            result << "#{attribute.first}=\"#{attribute.last}\""
                          }
      end

      "<#{tag_string.join(" ")}>"
    end
  end
end
