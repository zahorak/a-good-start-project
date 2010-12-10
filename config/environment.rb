# Load the rails application
require File.expand_path('../application', __FILE__)
require '~/good_start/vendor/ruby/1.8/gems/tolk-1.0/lib/tolk/sync.rb'
require '~/good_start/vendor/ruby/1.8/gems/tolk-1.0/lib/tolk/import.rb'

# Initialize the rails application
GoodStart::Application.initialize!
