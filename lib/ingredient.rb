class Ingredient < ActiveRecord::Base
  has_many :ingredients_recipes # points to join table
  has_many :recipes, through: :ingredients_recipes # links recipes
end
