source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
ruby '2.2.2'
gem 'rails', '4.2.1'
gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
# gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'postgres_ext'
gem 'puma'
gem 'haml'
gem 'haml-rails'
gem 'inline_svg'
gem 'devise'
gem 'angular_rails_csrf'
gem 'foreman'
gem 'omniauth-google-oauth2'

group :production, :staging do
  gem 'rails_12factor'
  gem 'rails_stdout_logging'
  gem 'rails_serve_static_assets'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'rspec-rails'
  gem 'rspec-activemodel-mocks'
  gem 'pry-rails'
  gem 'pry-theme'
  gem 'factory_girl_rails'
  gem 'launchy'
  gem 'magic_lamp'
  gem 'guard-rspec', require: false
  gem 'guard-livereload', require: false
  gem 'guard-bundler', require: false
  gem 'guard-teaspoon', github: 'modeset/guard-teaspoon'
  gem 'guard-zeus'
  gem 'guard-coffeescript'
  gem 'ruby_gntp'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'selenium-webdriver'
  gem 'phantomjs'
  gem 'teaspoon-jasmine'
  gem 'poltergeist'
  gem 'shoulda-matchers', github: 'thoughtbot/shoulda-matchers'
  gem 'seed_dump'
  gem 'simplecov', require: false
end

group :development, :test, :darwin do
  gem 'rb-fsevent', require: false
end
