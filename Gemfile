source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0.beta1'

group :development do
  gem 'mysql2'
end

group :production do
  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 4.0.0.beta1'
  gem 'coffee-rails', '~> 4.0.0.beta1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'execjs'
  gem 'therubyracer', platforms: :ruby

  # css framework
  gem 'twitter-bootstrap-rails'
  gem 'bootstrap-sass', '~> 2.1.0.0'
  gem 'font-awesome-sass-rails'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# upload your attachments or a picture
gem 'paperclip', '~> 3.5.0'

# markup
gem 'haml', '4.0.0'

#country
gem "country_select", "~> 1.2.0"

# authentication
gem 'activeadmin', github: 'gregbell/active_admin'
#gem 'protected_attributes'

gem 'omniauth'
gem 'omniauth-facebook'
gem "omniauth-google-oauth2"

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.0.1'

group :development do
  # want to have a thinner lighter and faster version of the rails server, you can use an alternative rails server 'thin'
  gem 'thin'

  # deploy
  #gem 'capistrano'
  #gem 'capify-ec2'
end

