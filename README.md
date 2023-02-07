# Dog Groomers and Pets

## Ruby version
2.7.4

## Rails version
5.2.8

## Dependencies
gem 'rails'

gem 'pg'

gem 'puma'

gem 'sass-rails'

gem 'uglifier'

gem 'coffee-rails'

gem 'jbuilder'

gem 'bootsnap'

### Testing
gem 'byebug'

gem 'rspec-rails'

gem 'pry'

gem 'simplecov'

gem 'capybara'

gem 'launchy'

gem 'orderly'

gem 'shoulda-matchers'

### Development
gem 'web-console'

gem 'listen'

## Database creation
Dog Groomers {name: string, master_groomer: boolean, salon: string, rating: integer}

Pets {name: string, age: integer, weight: integer, trained: boolean}

![Schema](https://user-images.githubusercontent.com/115383288/217367125-65f697ff-d997-4cc3-8a79-6283bce1ecc8.png)

## How to run the test suite
1. `bundle install` To add all gems needed.
1. `bundle exec rspec` To run the test suite.