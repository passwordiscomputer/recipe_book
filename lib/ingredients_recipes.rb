class IngredientsRecipe < ActiveRecord::Base
  belongs_to :ingredient # singular, single instance of ingredient
  belongs_to :recipe # singular, single instance of recipe
end
