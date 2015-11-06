get "/recipes" do
  @recipes = Recipe.all
  erb :"recipes/index"
end

get "/recipes/new" do
  erb :"recipes/new"
end

post "/recipes" do
  recipe = Recipe.new(name: params[:name], description: params[:description], steps: params[:steps])
  ingredients_list = params[:ingredients_list].split("\n")
  ingredients = convert_to_ingredients(ingredients_list)

  ingredients.each do |ingredient|
    recipe.ingredients << ingredient
  end
  recipe.save
  current_user.created_recipes << recipe
  redirect "/recipes/#{recipe.id}"
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

put "/recipes/:id" do

end

delete "/recipes/:id" do
  @recipe = Recipe.find_by(id: params[:id])
end

get "/ingredients" do
  @food_items = FoodItem.all.order(:name)
  erb :fooditems
end

get "/ingredients/:id/recipes" do
  @food = FoodItem.find_by(id: params[:id])
  @recipes = @food.recipes
  erb :"recipes/list-by-ingredient"
end
