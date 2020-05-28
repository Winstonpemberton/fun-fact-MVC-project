class UserController < ApplicationController

  get '/' do
    erb :index
  end

  get '/sign_up' do
    erb :'account/sign_up'
  end

  post '/sign_up' do
    user = User.create(params)
    session[:id] = user.id

    redirect to '/'
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
    if @user != nil && @user.password_digest == params[:password]
      session[:user_id] = @user.id
      redirect to '/account'
    end
    erb :'account/error'
  end

  get '/account' do
    @current_user = User.find_by_id(session[:user_id])
    if @current_user
      erb :'account/account'
    else
      erb :'account/error'
    end
  end

  post '/account' do
    redirect to '/account'
  end

  get '/account/edit' do
    erb :'account/account_edit'
  end

  post '/account/edit' do
    @current_user = User.find_by_id(session[:user_id])
    @current_user.username =  params[:username]
    @current_user.password =  params[:password]
    @current_user.email =  params[:email]

    redirect to '/account'
  end


end
