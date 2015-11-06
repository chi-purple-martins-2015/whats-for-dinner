module IngredientDataParser
  def convert_to_ingredients(ingredients_collection)
    ingredients_collection.map do |ingredient|
      parse_ingredient_data(ingredient)
    end
  end

  def partition_ingredient_input(ingredient)
    ingredient.partition(/\A\d?\s?\W?\d?\W?\d?/)
  end

  def parse_ingredient_data(ingredient)
    components = partition_ingredient_input(ingredient)
    components.shift
    amount = components.shift.strip
    remaining_elements = components[0].split(" ")
    unit_of_measurement = remaining_elements.shift

    remaining_elements = remaining_elements.join(" ")
    if remaining_elements.include?(", ")
      name_and_options = remaining_elements.split(", ")
      name_of_food = name_and_options[0]
      options = name_and_options[1]
    elsif remaining_elements.include?(" (")
      name_and_options = remaining_elements.split(" (")
      name_of_food = name_and_options[0]
      options = "(" << name_and_options[1]
    else
      name_of_food = remaining_elements
    end

    food_item = FoodItem.find_or_create_by(name: name_of_food)
    ingredient = Ingredient.create(amount: amount, unit_of_measurement: unit_of_measurement, food_item_id: food_item.id)

    if options
      ingredient.update_attribute(:options, options)
    end

    return ingredient
  end
end
