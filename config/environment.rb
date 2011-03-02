# Load the rails application
require File.expand_path('../application', __FILE__)
require Rails.root.join('lib/scraper.rb')

# Initialize the rails application
Rubeddit::Application.initialize!
