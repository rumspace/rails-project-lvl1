[![Makefile CI](https://github.com/rumspace/rails-project-lvl1/actions/workflows/makefile.yml/badge.svg)](https://github.com/rumspace/rails-project-lvl1/actions/workflows/makefile.yml) [![hexlet-check](https://github.com/rumspace/rails-project-lvl1/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/rumspace/rails-project-lvl1/actions/workflows/hexlet-check.yml)

# HexletCode

**HexletCode** is a HTML text form generator that simplifies your forms generation similar to SimpleForm.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hexlet_code'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install hexlet_code

## Usage

To use the gem firstly require it in your code by using:

```ruby
require "hexlet_code"
```

To use method `form_for` which generates HTML form it's required to define a `Struct` and initialize an object with data.

```ruby
User = Struct.new(:name, :job, keyword_init: true)
user = User.new job: 'hexlet'
 
HexletCode.form_for user do |f|
  f.input :name
  f.input :job
 f.submit
end

# <form action="#" method="post">
#   <label for="name">Name</label>
#   <input name="name" type="text">
#   <label for="job">Job</label>
#   <input name="job" type="text" value="hexlet">
#   <input name="commit" type="submit" value="Save">
# </form>
```

A method `input` passed in a block has an option to send a type of input you want to generate.

```ruby
User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new name: 'rob', job: 'hexlet', gender: 'm'

HexletCode.form_for user do |f|
  f.input :name
  f.input :job, as: :text
end

# <form action="#" method="post">
#   <input name="name" type="text" value="rob">
#   <textarea cols="20" rows="40" name="job">hexlet</textarea>
# </form>
```

If the object has no field to call for, `NoMethodError` will be raised.

```ruby
html = HexletCode.form_for user, url: '/users' do |f|
  f.input :name
  f.input :job, as: :text
  # Поля age у пользователя нет
  f.input :age
end
# =>  `public_send': undefined method `age' for #<struct User id=nil, name=nil, job=nil> (NoMethodError)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` or `make minitest` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/hexlet_code. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/hexlet_code/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the HexletCode project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/hexlet_code/blob/master/CODE_OF_CONDUCT.md).
