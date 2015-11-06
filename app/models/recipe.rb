class Recipe < ActiveRecord::Base
  belongs_to :creator, class_name: "User"

  has_many :ingredients
  has_many :food_items, through: :ingredients

  has_many :collections
  has_many :users, through: :collections

  validates :name, presence: true
  validates :description, presence: true
  validates :steps, presence: true

  def list_steps
    self.steps.split("\n")
  end
end
