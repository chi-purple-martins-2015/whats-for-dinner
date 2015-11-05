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

get "/users/new" do
  erb :"users/new"
end

get "/users/:id" do
  @user = User.find_by(id: params[:id])
  if @user
    erb :"users/profile"
  else
    erb :"users/no-such-user"
  end
end


post "/users" do
  user = User.new(params[:user])
  if user.save
    session[:id] = user.id
    redirect "/users/#{user.id}"
  else
    @errors = user.errors.full_messages
    erb :"users/new"
  end
end
