# application.rb
require 'sinatra'

configure do
  set :show_exceptions, true

  # Un-comment this if you are using Vagrant or any type of VM/container such as Docker
  # set :bind, '0.0.0.0'
end

################################
# Application Routes
################################

# Home
get "/" do
  "Hello, this is our application homepage. But we aren't going to do anything with it."
end

# Service1: Return all our Text entities
post "/api/events" do
  content_type :json  
end

################################
# 404
################################
not_found do
  'Whatever you are looking for its not here!'
end

################################
# 500
################################
error do
  'Sorry there was a nasty error - ' + env['sinatra.error'].name
end

