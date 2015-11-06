helpers do
  def convert_to_ingredients(ingredients_collection)
    ingredients_collection.map do |ingredient|
      parse_ingredient_data(ingredient)
    end
  end

  def parse_ingredient_data(ingredient)
    components = ingredient.partition(/\A\d?\s?\W?\d?\W?\d?/)
    components.shift
    amount = components.shift.strip!
    remaining_elements = components[0].split(" ")
    unit_of_measurement = remaining_elements.shift
    name_of_food = remaining_elements.join(" ")

    food_item = FoodItem.find_or_create_by(name: name_of_food)
    ingredient = Ingredient.create(amount: amount, unit_of_measurement: unit_of_measurement, food_item_id: food_item.id)

    return ingredient
  end

end
