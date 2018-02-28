ENV['RACK_ENV'] = 'test'

require("rspec")
require("pg")
require("sinatra/activerecord")
require("ingredient")
require("recipe")
require("ingredients_recipes")
require("tag")

RSpec.configure do |config| # clear db between spec runs
  config.after(:each) do
    Ingredient.all.each do |ingredient|
      ingredient.destroy
    end
  end
end

RSpec.configure do |config| # clear db between spec runs
  config.after(:each) do
    Recipe.all.each do |recipe|
      recipe.destroy
    end
  end
end
