source 'https://rubygems.org'

ruby '2.2.2'
gem 'rails', '4.2.3'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'bcrypt', '~> 3.1.7'
gem 'devise', '~> 3.4.1'

group :development, :test do
  gem 'byebug'
  gem 'spring'
end

group :development, :test do
  gem 'pg'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end
group :production do
  gem 'puma'
  gem 'pg'
end

group :test do
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
  gem 'rspec-expectations', :require => false
  gem 'shoulda-matchers'
end
