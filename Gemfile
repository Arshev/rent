source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# ruby '2.4.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3'
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
# gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0.1'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Use Capistrano for deployment
  gem "capistrano", "~> 3.10", require: false
  gem "capistrano-bundler", "~> 1.3.0", require: false
  # gem "capistrano-rvm", "~> 0.1.2", require: false
  gem 'capistrano-rbenv', '~> 2.1', '>= 2.1.4', require: false
  gem "capistrano-rails", "~> 1.3.1", require: false
  gem 'capistrano-passenger', "~> 0.2.0", require: false
  gem 'capistrano-rails-console', "~> 2.2.1", require: false
  gem 'capistrano-npm'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'bootstrap-sass', '~> 3.3.7'
gem 'devise', '~> 4.4.0'
gem 'devise-i18n'
gem 'jquery-rails', '~> 4.3.1'
gem 'paperclip', '~> 5.1.0'
gem 'jquery-ui-rails', '~> 5.0.5'
gem 'gon', '~>6.4.0'
# gem 'twilio-ruby', '~> 5.6.0'
# gem 'sidekiq', '~> 5.1.1'
gem 'sucker_punch'
gem 'dotenv-rails', require: 'dotenv/rails-now'
gem "recaptcha", require: "recaptcha/rails"
gem 'sitemap_generator', '~>6.1.0'
gem 'whenever', require: false
gem 'tinymce-rails'
gem 'tinymce-rails-langs'
gem 'mainsms_api'
gem 'meta-tags'
gem 'active_model_serializers', '~> 0.10.7'
gem 'webpacker', '~> 3.5'
gem 'foreman'
gem 'rails-i18n', '~> 5.1' # For 5.0.x, 5.1.x and 5.2.x
gem 'rack-cors', require: 'rack/cors'

gem 'ed25519', '>= 1.2', '< 2.0'
gem 'bcrypt_pbkdf', '>= 1.0', '< 2.0'
