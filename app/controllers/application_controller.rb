require './config/environment'
require_relative "helper"

class ApplicationController < Sinatra::Base
   include Helper

# creates a session id for the user
  configure do
    enable :sessions
    set :session_secret, 'test'
    set :views, 'app/views'
  end
# when the website starts idex is the homepage
  get '/' do
    erb :index
  end
# if the user types in the worng information the route is supposed to be used
  get '/error' do
    erb :'errors/error'
  end
# if a username is taken this route pulls up the error page saying so
  get '/name_taken' do
    erb :'errors/name_taken'
  end

end
