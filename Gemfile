# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.3"

gem "rails", "~> 6.0.2", ">= 6.0.2.2"
# Use postgresql as the database for Active Record
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 4.1"

gem "webpacker", "~> 5.x" # Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.7"
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.2", require: false
gem "haml-rails", "~> 2.0"
gem "rollbar"
  
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "rspec-rails"
  gem "pry-rails"
  gem "pry-nav"
  gem "rubocop", "~> 0.80.0"
  gem "standard", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false
  gem "factory_bot_rails"
end

group :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "capybara"
  gem "launchy" # for capybara save_and_open_page
  gem "selenium-webdriver"
  gem "webdrivers"
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "annotate"
end
