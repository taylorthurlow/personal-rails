source 'https://rubygems.org'

gem 'bcrypt', '~> 3.1.7'          # Use ActiveModel has_secure_password
gem 'coffee-rails', '~> 4.1.0'    # Use CoffeeScript for .coffee assets and views
gem 'font-awesome-rails'          # cool icons
gem 'friendly_id', '~> 5.1.0'     # nice URL slugs
gem 'jquery-rails'                # Use jquery as the JavaScript library
gem 'kaminari'                    # pagination
gem 'rails', '4.2.6'              # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'redcarpet'                   # markdown
gem 'responders'                  # DRYer controller responses
gem 'sass-rails', '~> 5.0'        # Use SCSS for stylesheets
gem 'sitemap_generator'           # sitemap for SEO
gem 'turbolinks'                  # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'uglifier', '>= 1.3.0'        # Use Uglifier as compressor for JavaScript assets

group :development do
  gem 'better_errors'                               # better error pages
  gem 'capistrano', '~> 3.8.2'                      # Use Capistrano for deployment
  gem 'capistrano-ext', '~> 1.2.1'
  gem 'capistrano-passenger'
  gem 'capistrano-rails', '~> 1.3.0'
  gem 'capistrano-rails-console', require: false
  gem 'capistrano-rbenv'
  gem 'rubocop'
  gem 'spring'                                      # speeds up development by keeping your application running in the background
  gem 'web-console', '~> 2.0'                       # Access an IRB console on exception pages or by using <%= console %> in views
end

group :test do
  gem 'mocha'
  gem 'simplecov', require: false                   # generate test coverage reports
end

group :development, :test do
  gem 'byebug'                    # debugger
  gem 'guard'                     # Make tests auto-run when changing files
  gem 'guard-livereload', '2.3.0', require: false
  gem 'guard-minitest'
  gem 'sqlite3'                   # Use sqlite3 as the database for Active Record
end

group :production do
  gem 'mysql'                     # use mySQL in production instead of SQLite
end
