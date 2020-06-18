source 'https://rubygems.org'

ruby '~> 2.5.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.2.1'
gem 'bootsnap', require: false
gem 'mysql2', '~> 0.5.2'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'mini_racer'
gem 'dotenv-rails'
gem 'solidus', '~> 2.9.0'
gem 'solidus_auth_devise'
gem 'solidus_i18n', github: 'solidusio-contrib/solidus_i18n', branch: 'master'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'pry-byebug'
  gem 'rails-erd'
  gem 'annotate'
  gem 'rubocop'
  gem 'capybara', '~> 2.15.2'
  gem 'launchy', '~>2.4.3'
  gem 'webdrivers'
  gem 'rails-controller-testing'
  gem 'httpclient'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring-commands-rspec'
  gem 'rails-erd'
  gem 'spring-commands-rspec'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'bullet'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem "aws-sdk", "~> 2.3"
