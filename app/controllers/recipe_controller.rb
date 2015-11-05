get "/recipes/new" do
  erb :"recipes/new"
end

post "/recipes" do
  if request.xhr?
    collection_of_ingredients = params[:ingredients]

    collection_of_ingredients.each do |ingredient|
      components = ingredient.partition(/\A\d?\s?\W?\d?\W?\d?/)
      amount = components[1].strip!
      remaining_elements = components.split(" ")
      unit_of_measurement = remaining_elements.shift
      food_item = remaining_elements.join(" ")
    end
  end
end
