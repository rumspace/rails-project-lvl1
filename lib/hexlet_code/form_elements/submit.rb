# frozen_string_literal: true

# Form <submit> tag generator
class Submit
  TAG_NAME = 'input'
  NAME = 'commit'
  TYPE = 'submit'

  def self.build(value)
    submit = {}
    submit[:name] = TAG_NAME
    submit[:attributes] = { name: NAME, type: TYPE, value: value }
    submit
  end
end
