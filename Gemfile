source 'https://rubygems.org'

gem 'bcrypt'          # Use ActiveModel has_secure_password
gem 'coffee-rails'    # Use CoffeeScript for .coffee assets and views
gem 'font-awesome-rails'          # cool icons
gem 'friendly_id'    # nice URL slugs
gem 'jquery-rails'                # Use jquery as the JavaScript library
gem 'kaminari'                    # pagination
gem 'rails', '5.2.1'              # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'redcarpet'                   # markdown
gem 'responders'                  # DRYer controller responses
gem 'sassc-rails'        # Use SCSS for stylesheets (deprecated, see sass/sassc-rails#105)
gem 'sitemap_generator'           # sitemap for SEO
gem 'tailwindcss'
gem 'turbolinks'                  # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'uglifier'       # Use Uglifier as compressor for JavaScript assets
gem 'webpacker'       # js dependencies

group :development do
  gem 'better_errors'                               # better error pages
  gem 'capistrano'                    # Use Capistrano for deployment
  gem 'capistrano-ext'
  gem 'capistrano-passenger'
  gem 'capistrano-rails'
  gem 'capistrano-rails-console', require: false
  gem 'capistrano-rbenv'
  gem 'rubocop'
  gem 'spring'                                      # speeds up development by keeping your application running in the background
  gem 'web-console'                      # Access an IRB console on exception pages or by using <%= console %> in views
end

group :test do
  gem 'mocha'
  gem 'rails-controller-testing'          # allow old rails testing stuff
  gem 'simplecov', require: false                   # generate test coverage reports
end

group :development, :test do
  gem 'byebug'                    # debugger
  gem 'guard'                     # Make tests auto-run when changing files
  gem 'guard-livereload', require: false
  gem 'guard-minitest'
  gem 'rails_real_favicon'        # favicons for all platforms
  gem 'sqlite3'                   # Use sqlite3 as the database for Active Record
end

group :production do
  gem 'mysql2'                    # use mySQL in production instead of SQLite
end
