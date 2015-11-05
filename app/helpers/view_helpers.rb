helpers do

  def logged_in?
    session[:id] != nil
  end

  def current_user
    if logged_in?
      User.find_by(id: session[:id])
    end
  end

end
