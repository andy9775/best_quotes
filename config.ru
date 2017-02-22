require './config/application'

# similar to rails config.ru file except rails requires
# config/environment.rb and environment.rb requires the application
run BestQuotes::Application.new
