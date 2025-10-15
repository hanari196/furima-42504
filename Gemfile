source "https://rubygems.org"

ruby "3.2.0"
gem "rails", "~> 7.1.0"
gem "sprockets-rails"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri windows ] 
  gem 'dotenv-rails'
  gem "sqlite3", "~> 1.4"

  gem 'rspec-rails', '~> 4.0.0'
  gem 'factory_bot_rails'
  gem 'faker'

  gem 'rubocop', '1.71.2', require: false
  gem 'rubocop-rails', require: false
end

group :development do
  gem "web-console"
end

group :production do
  gem 'pg'
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end

gem 'devise'
gem 'active_hash'
gem 'payjp'
gem 'mysql2', '>= 0.5.5', '< 1.0'
gem 'gon'
