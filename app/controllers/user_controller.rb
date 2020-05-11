class UserController < ApplicationController

  get '/' do
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
    if @user != nil && @user.password == params[:password]
      session[:user_id] = @user.id
      redirect to '/account'
    end
    erb :error
  end

  get '/account' do
    @current_user = User.find_by_id(session[:user_id])
    if @current_user
      erb :account
    else
      erb :error
    end
  end

end
