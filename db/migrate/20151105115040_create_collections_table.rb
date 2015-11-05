class CreateCollectionsTable < ActiveRecord::Migration
  def change
    t.belongs_to :recipe, index: true
    t.belongs_to :user, index: true
  end
end
