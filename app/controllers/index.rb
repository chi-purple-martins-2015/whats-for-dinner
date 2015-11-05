get "/" do
  erb :index
end

get "/login" do
  erb :login
end

post "/login" do
  user = User.find_by(email: params[:email])
  if user
    if user.password == params[:password]
      session[:id] = user.id
      redirect "/users/#{user.id}"
    else
      @error = "Sorry, that password did not match our records. Please try again."
      erb :login
    end
  else
    @error = "Sorry, that email address did not match our records. Please try again."
    erb :login
  end
end

get "/logout" do
  if logged_in?
    session[:id] = nil
    redirect "/"
  end
end
