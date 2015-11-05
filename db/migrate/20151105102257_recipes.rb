class Recipes < ActiveRecord::Migration
  def change
    create_table :recipe do |t|
      t.belongs_to :creator, index: true
      t.string :name, null: false
      t.text :description, null: false
      t.text :steps, null: false

      t.timestamps null: false
    end
  end
end
