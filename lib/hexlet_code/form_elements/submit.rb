# frozen_string_literal: true

require_relative '../tag'

# Form <submit> tag generator
class Submit
  TAG_NAME = 'input'
  NAME = 'commit'
  TYPE = 'submit'

  def self.build(value)
    Tag.build(TAG_NAME, name: NAME, type: TYPE, value: value)
  end
end
