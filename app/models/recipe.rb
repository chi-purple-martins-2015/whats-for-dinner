class Recipe < ActiveRecord::Base
  has_many :ingredients

  validates :name, presence: true
  validates :description, presence: true
  validates :steps, prescence: true
end
