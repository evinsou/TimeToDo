source 'http://rubygems.org'

gem 'rails', '3.1.3'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'jquery-ui-rails'
end
gem 'jquery-rails'
#gem 'acts_as_list'
group:development do
  gem 'rspec'
  gem "rspec-rails", ">= 2.0.0"
  gem 'sqlite3'
  gem 'bson_ext'
  gem 'sqlite3'
end
group :test do
  gem 'capybara'
  gem 'rspec-rails', ">= 2.0.0"
  gem 'cucumber-rails', :require => false
  gem 'launchy'
  gem 'database_cleaner'
  # Pretty printed test output
  gem 'turn', '~> 0.8.3', :require => false
end
group :production do
  gem 'therubyracer-heroku', '0.8.1.pre3'
  gem 'pg'
  gem 'heroku'
  gem 'thin'
end

