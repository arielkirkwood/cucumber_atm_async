require File.join(File.dirname(__FILE__), '..', '..', 'lib', 'cucumber_atm')

require 'capybara/cucumber'
Capybara.app = Sinatra::Application
Sinatra::Application.set :environment, :test
