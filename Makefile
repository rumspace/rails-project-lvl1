install:
	gem install bundler
	bundle install

lint:
	bundle exec rubocop lib