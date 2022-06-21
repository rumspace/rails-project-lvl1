# frozen_string_literal: true

# HTML tag generator
class Tag
  PAIRED_TAGS = %w[label textarea form button select optgroup fieldset output].freeze

  def self.build(tag_name, **attributes)
    tag = [tag_name]

    unless attributes.empty?
      tag.concat attributes.each_with_object([]) { |attribute, result|
                   result << "#{attribute.first}=\"#{attribute.last}\"" unless attribute.last.nil?
                 }
    end

    "<#{tag.join(' ')}>#{yield if block_given?}#{"</#{tag_name}>" if PAIRED_TAGS.include?(tag_name)}"
  end
end
