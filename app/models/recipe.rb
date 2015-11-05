class Recipe < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  
  has_many :ingredients
  has_many :food_items, through: :ingredients

  validates :name, presence: true
  validates :description, presence: true
  validates :steps, prescence: true
end
