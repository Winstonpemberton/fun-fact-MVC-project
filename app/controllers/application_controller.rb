require './config/environment'
require_relative "helper"

class ApplicationController < Sinatra::Base
   include Helper

  configure do
    enable :sessions
    set :session_secret, 'test'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

end
