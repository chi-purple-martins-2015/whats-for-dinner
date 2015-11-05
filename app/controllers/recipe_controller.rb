get "/recipes/new" do
  erb :"recipes/new"
end

post "/recipes" do
  if request.xhr?
    recipe = Recipe.create(name: params[:name], description: params[:description], steps: params[:steps])
    ingredients = convert_to_ingredients(params[:ingredients])
    ingredients.each.update_attribute(:recipe_id, recipe.id)
    redirect "/recipes/#{recipe.id}"
  end
end

get "/recipes/:id" do
  @recipe = Recipe.find_by(id: params[:id])
  @ingredients = Ingredient.where(recipe_id: params[:id])
  erb :"recipes/show"
end
