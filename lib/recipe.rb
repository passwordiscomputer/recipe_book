class Recipe < ActiveRecord::Base
  has_many :ingredients_recipes # points to join table
  has_many :ingredients, through: :ingredients_recipes # links ingredients
  has_many :recipes_tags # points to join table
  has_many :tags, through: :recipes_tags # links tags
  validates(:title, :presence => true)
  before_save(:downcase_title)

private
  def downcase_title
    self.title=(title().downcase)
  end

end
