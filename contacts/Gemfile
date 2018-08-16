# frozen_string_literal: true
source 'https://rubygems.org'

# Use rails as framework
gem 'rails', '5.0.1'

# Use Postgresql as the database for Active Record
gem 'pg', '0.19.0'

# Use Puma as the app server
gem 'puma', '3.6.2'

# Build JSON APIs with ease.
gem 'jbuilder', '2.6.1'

# Use paperclip for upload
gem 'paperclip', '5.1.0'

# Support for Cross-Origin Resource Sharing (CORS)
gem 'rack-cors', '0.4.0', require: 'rack/cors'

# RuboCop is a Ruby static code analyzer
gem 'rubocop', '0.46.0', require: false

# Thor is a toolkit for command-line interfaces
gem 'thor', '0.19.1'

# Seamless JWT authentication for Rails API
gem 'bcrypt-ruby'

gem 'friendly_id', '5.1.0'

group :test do
  # Rspec supports
  gem 'rspec-rails'
end

group :development do
  # Spring speeds up development by keeping application running in background
  gem 'spring', '2.0.0'
  gem 'spring-watcher-listen', '2.0.1'
end

group :development, :test do
  # Call 'binding.pry' to stop execution and get a debugger console
  gem 'pry', '0.10.4'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', '1.2.2', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
