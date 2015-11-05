class Ingredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :food_item

  def food_item
    FoodItem.find_by(id: self.food_item_id).name
  end
end
