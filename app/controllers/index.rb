get "/" do
  erb :index
end

get "/login" do
  erb :login
end

get "/users/new" do
  erb :"users/new"
end
