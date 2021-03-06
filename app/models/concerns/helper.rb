module Helper
  def logged_in?
    !!session[:id]
  end

  def current_user
    @current_user ||= User.find(session[:id]) if session[:id]
  end

  def login(username, password)
    user = User.find_by(:username => username)
    if user && user.authenticate(password)
      session[:id] = user.id
    else
      redirect '/'
    end
  end

  def logout!
    session.clear
  end
end
