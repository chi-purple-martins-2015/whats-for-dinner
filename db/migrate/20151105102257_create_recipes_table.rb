class CreateRecipesTable < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.belongs_to :creator, index: true
      t.string :name, null: false
      t.text :description, null: false
      t.array :steps, null: false

      t.timestamps null: false
    end
  end
end
