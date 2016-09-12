source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'
# Use sqlite3 as the database for Active Record
#gem 'sqlite3'
	# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

#gem 'angular_rails_csrf'
source "https://rails-assets.org" do
  gem "rails-assets-angular-devise"
end
gem 'clean_pagination', '~> 1.0'
gem 'devise'
gem 'enumerize'
gem 'rails_admin'
gem 'cancancan', '~> 1.10'
gem 'simple_form'
gem 'bootstrap-sass'
gem 'sprockets-rails', :require => 'sprockets/railtie'
gem 'angular-rails-templates'
gem 'redactor-rails'
gem 'rich', github: 'bastiaanterhorst/rich'
gem 'paperclip'
gem 'formtastic', '~> 3.0'
gem "carrierwave"
gem "mini_magick"
gem 'bootstrap-kaminari-views'
gem 'kaminari'
gem 'grape'
gem 'grape-cancan'
gem 'grape-kaminari'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'
	
  gem 'pg'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
group :production do
	gem 'rails_12factor'

	end
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'rspec-rails', '~> 3.5'
  gem 'byebug'
  gem "factory_girl_rails", "~> 4.0", :require => false
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

