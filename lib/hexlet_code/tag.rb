# frozen_string_literal: true

# HTML tag generator
class Tag
  PAIRED_TAGS = %w[label textarea form button select optgroup fieldset output].freeze

  def self.build(tag_name, attributes)
    tag = {}
    tag[:name] = tag_name
    tag[:attributes] = attributes.compact
    tag[:content] = yield if block_given?
    tag[:end_tag] = "/#{tag_name}" if PAIRED_TAGS.include?(tag_name)

    generate_html(tag)
  end

  def self.generate_html(tag)
    attributes_array = tag[:attributes].each_with_object([]) do |attribute, result|
      result << "#{attribute.first}=\"#{attribute.last}\""
    end

    "<#{tag[:name]} #{attributes_array.join(' ')}>#{tag[:content]}#{"<#{tag[:end_tag]}>" if tag[:end_tag]}"
  end
end
