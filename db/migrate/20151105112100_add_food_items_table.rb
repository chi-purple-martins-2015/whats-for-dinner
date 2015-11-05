class AddFoodItemsTable < ActiveRecord::Migration
  def change
    create_table :food_items do |t|
      t.string :name, {null: false, unique: true}

      t.timestamps null: false
    end
  end
end
