source 'https://rubygems.org'
gem 'rails', '4.2.3'

group :development, :test do
  gem 'pg'
end
group :production do
  gem 'pg'
end

group :test do
  gem 'cucumber-rails', :require => false
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
  gem 'rspec-expectations', :require => false
end
