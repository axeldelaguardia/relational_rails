# Dog Groomers and Pets

## Ruby version
2.7.4

## Rails version
5.2.8

## Dependencies
### 
gem 'rails', '~> 5.2.8', '>= 5.2.8.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false

### Testing
gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
gem 'rspec-rails'
gem 'pry'
gem 'simplecov'
gem 'capybara'
gem 'launchy'
gem 'orderly'
gem 'shoulda-matchers', '~> 5.0'

### Development
gem 'web-console', '>= 3.3.0'
gem 'listen', '>= 3.0.5', '< 3.2'

## Database creation
Dog Groomers {name: string, master_groomer: boolean, salon: string, rating: integer}

Pets {name: string, age: integer, weight: integer, trained: boolean}

![Schema](https://user-images.githubusercontent.com/115383288/217367125-65f697ff-d997-4cc3-8a79-6283bce1ecc8.png)

## How to run the test suite
1. `bundle install` To add all gems needed.
1. `bundle exec rspec` To run the test suite.