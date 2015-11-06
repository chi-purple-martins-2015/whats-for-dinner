get "/recipes" do
  @recipes = Recipe.all
  erb :"recipes/index"
end

get "/recipes/new" do
  erb :"recipes/new"
end

post "/recipes" do
  if request.xhr?
    recipe = Recipe.create(name: params[:name], description: params[:description], steps: params[:steps])
    ingredients = convert_to_ingredients(params[:ingredients])
    ingredients.each do |ingredient|
      recipe.ingredients << ingredient
    end
    current_user.created_recipes << recipe
    redirect "/recipes/#{recipe.id}"
  end
end

get "/recipes/:id" do
  @recipe = Recipe.find_by(id: params[:id])
  if @recipe
    @ingredients = @recipe.ingredients
    erb :"recipes/show"
  else
    erb :"recipes/no-such-recipe"
  end
end

post "/users/recipes/:id" do
  recipe = Recipe.find_by(id: params[:id])
  current_user.recipes << recipe
  redirect "/recipes/#{recipe.id}"
end

delete "/users/recipes/:id" do
  current_user.collections.find_by(recipe_id: params[:id]).destroy
  redirect "/recipes/#{params[:id]}"
end

get "/recipes/:id/edit" do
  @recipe = Recipe.find_by(id: params[:id])
  erb :"recipes/edit"
end
