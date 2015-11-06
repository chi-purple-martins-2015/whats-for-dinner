

include IngredientDataParser

User.create([
    {first_name: "Katelyn", last_name: "D", username: "shrinkydink", email: "k@email.com", password: "password"},
    {first_name: "Jen", last_name: "T", username: "lawyer_jan", email: "j@email.com", password: "password"},
    {first_name: "Ben", last_name: "F", username: "salty", email: "s@email.com", password: "password"}
  ])

cabbage_salad_recipe = Recipe.new(name: "Napa Cabbage Salad with Buttermilk Dressing", description: "From http://smittenkitchen.com/blog/2008/07/napa-cabbage-salad-with-buttermilk-dressing/", steps: "1. Whisk together buttermilk, mayonnaise, vinegar, shallot, sugar, 1/2 teaspoon salt, and 1/4 teaspoon pepper in a large bowl until sugar has dissolved, then whisk in chives.\n2. Toss cabbage, radishes, and celery with dressing.")

cabbage_salad_ingredients = "1/2 cup buttermilk\n2 tablespoons mayonnaise\n2 tablespoons cider vinegar\n2 tablespoons shallot, minced\n1 tablespoon sugar\n3 tablespoons chives (finely chopped)\n1 pound Napa cabbage, cored and thinly sliced crosswise\n6 small radishes, diced\n2 stalks celery, thinly sliced diagonally"

ingredients_list = cabbage_salad_ingredients.split("\n")
ingredients = convert_to_ingredients(ingredients_list)

ingredients.each do |ingredient|
  cabbage_salad_recipe.ingredients << ingredient
end
cabbage_salad_recipe.save

waffle_recipe = Recipe.new(name: "Rich Buttermilk Waffles", description: "From http://smittenkitchen.com/blog/2007/03/again-with-the-pining/", steps: "1. Combine the dry ingredients. Mix together the buttermilk, sour cream or yogurt and the egg yolks. Stir in the butter and vanilla.\n2. Brush the waffle iron lightly with oil and preheat it. Stir the wet into the dry ingredients. Beat the egg whites with the whisk or electric mixer (spotlessly clean ones work best) until they hold soft peaks. Stir them gently into the batter.\n3. Spread a ladleful or so of batter onto the waffle iron and bake until the waffle is done, usually 3 to 5 minutes, depending on your iron. Serve immediately or keep warm for a few minutes in a low oven.")

waffle_ingredients = "2 cups all-purpose flour\n1/2 teaspoon salt\n2 tablespoons sugar\n1 1/2 teaspoons baking soda\n1 3/4 cups buttermilk\n2 large eggs, separated\n4 tablespoons butter, melted and cooled\n1/2 teaspoon vanilla extract"

ingredients_list = waffle_ingredients.split("\n")
ingredients = convert_to_ingredients(ingredients_list)

ingredients.each do |ingredient|
  waffle_recipe.ingredients << ingredient
end
waffle_recipe.save

User.first.created_recipes << cabbage_salad_recipe
User.last.created_recipes << waffle_recipe
