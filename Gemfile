source "https://rubygems.org"

ruby "3.3.1"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.1.3", ">= 7.1.3.2"

gem "pg", "~> 1.2"

# Use rswag for API documentation
gem 'rswag'

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", ">= 4.0.1"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem "bcrypt", "~> 3.1.7"

# Use jwt for authentication
gem 'jwt'

# Use rack-cors for handling Cross-Origin Resource Sharing (CORS), making cross-origin Ajax possible
gem 'rack-cors'

# Active Model Serializer for JSON serialization
gem 'active_model_serializers'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin Ajax possible
# gem "rack-cors"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ]
  gem 'rspec-rails'
  gem 'rswag-specs'
    # A library for generating fake data such as names, addresses, and phone numbers. [https://github.com/faker-ruby/faker]
  gem 'faker'

end


group :test do
  # Allows you to focus on a few tests with ease without having to use command-line arguments (https://github.com/seattlerb/minitest-focus)
  gem 'minitest-focus'

  # Making tests easy on the fingers and eyes (https://github.com/thoughtbot/shoulda)
  gem 'shoulda', '~> 4.0'

  # Making tests easy on the fingers and eyes (http://thoughtbot.com/community/)
  gem 'shoulda-matchers', '~> 4.4', require: false

  # A library for setting up Ruby objects as test data. [https://github.com/thoughtbot/factory_bot_rails]
  gem 'factory_bot_rails'
end


group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end
