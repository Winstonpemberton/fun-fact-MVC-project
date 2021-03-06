class UserController < ApplicationController

# used to pull up the signup page
  get '/sign_up' do
    erb :'account/sign_up'
  end
# used to create a user with the information users typed in
  post '/sign_up' do
    username =  params[:username]
    if name_taken?(username)
      redirect '/name_taken'
    end
    if name_taken?(username) == false
      user = User.create(params)
      session[:id] = user.id
      redirect '/'
    else
      redirect '/signup'
    end
    redirect '/'
  end
# Makes sure login information is correct then redirects to the account route
  post '/login' do
    redirect '/error' if params[:username] == "" || params[:password] == ""
    login(params[:username], params[:password])
    redirect '/account'
  end

# if the login succeeded it opens the users account page
  get '/account' do
    redirect '/error' if !logged_in?
    @current_user = User.find_by_id(session[:id])
    erb :'account/account'
  end

# some erbs post to account but I just need it to pull up their account page
  post '/account' do
    redirect to '/account'
  end
# pulls up the page to edit a users login information
  get '/account/edit' do
    erb :'account/account_edit'
  end
# changes the login information to the newly typed information
  patch '/account/edit' do
    @current_user = User.find_by_id(session[:id])
    username =  params[:username]
    if name_taken?(username)
      redirect '/name_taken'
    end
    @current_user.username =  params[:username]
    @current_user.password =  params[:password]
    @current_user.email =  params[:email]
    @current_user.save

    redirect to '/account'
  end
# gets all the comments done by this user and a link to their associated fact
  get "/account/comments" do
    @current_user = User.find_by_id(session[:id])
    erb :'account/comments'
  end
# the route used to log a user out
  get '/logout' do
    logout!
    redirect '/'
  end

end
