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
