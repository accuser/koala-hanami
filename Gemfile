source 'https://rubygems.org'

ruby '2.5.3'

gem 'rake'
gem 'hanami',       '~> 1.3'
gem 'hanami-model', '~> 1.3'

gem 'sqlite3'

gem 'haml'

group :development do
  gem 'shotgun', platforms: :ruby
  gem 'hanami-webconsole'
end

group :test, :development do
  gem 'dotenv', '~> 2.4'
end

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'simplecov', require: false
end

group :production do
  gem 'puma'
end
