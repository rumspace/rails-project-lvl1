install:
	bundle install

lint:
	bundle exec rubocop

lint-fix:
	bundle exec rubocop -A

minitest:
	ruby -Ilib:test test/test_hexlet_code.rb