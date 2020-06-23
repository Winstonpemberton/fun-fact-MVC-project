module Helper

# checks to see if the user is logged in
  def logged_in?
    !!session[:id]
  end

# used to validate login credentials
  def login(username, password)
    user = User.find_by(:username => username)
    if user && user.authenticate(password)
      session[:id] = user.id
    end
  end

  def name_taken?(username)
    usernames = []
    User.all.each do |user|
      usernames << user.username
    end
    usernames.include?(username)
  end

  def logout!
    session.clear
  end
end
