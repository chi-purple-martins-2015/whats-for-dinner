class CreateIngredientsTable < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.belongs_to :food_item, index: true
      t.belongs_to :recipe, index: true
      t.string :amount
      t.string :unit_of_measurement

      t.timestamps null: false
    end
  end
end
