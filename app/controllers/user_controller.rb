class UserController < ApplicationController

  get '/sign_up' do
    erb :'account/sign_up'
  end

  post '/sign_up' do
    user = User.create(params)
    session[:id] = user.id

    if user.save
      redirect '/'
    else
      redirect '/signup'
    end
  end

  post '/login' do
    login(params[:username], params[:password])
    redirect '/account'
  end

  #   @user = User.find_by(:username => params[:username])
  #   if @user != nil && @user.password_digest == params[:password]
  #     session[:user_id] = @user.id
  #     redirect to '/account'
  #   end
  #   erb :'account/error'
  # end

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
