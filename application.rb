# application.rb
require 'sinatra'

configure do
  set :show_exceptions, true

  # Un-comment this if you are using Vagrant or any type of VM/container such as Docker
  # set :bind, '0.0.0.0'
end

before do

  if request.request_method != 'GET'
    # Pull out the authorization header
    if env['HTTP_AUTHORIZATION'] && env['HTTP_AUTHORIZATION'].split(':').length == 2
      auth_header = env['HTTP_AUTHORIZATION'].split(':')
    else
      halt 401
    end

    public_key  = auth_header[0]
    signature   = auth_header[1]

    halt 403 if public_key != '123'
  end
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
  200
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

