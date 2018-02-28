ENV['RACK_ENV'] = 'test'

require("rspec")
require("sinatra/activerecord")
require("ingredients_recipes")
require("ingredient")
require("recipe")


describe(Ingredient) do

  describe "#ingredients" do
    it "lists all ingredients" do
      ingredient1 = Ingredient.create({:name => "sassafrass"})
      ingredient2 = Ingredient.create({:name => "coffee"})
      expect(Ingredient.all).to eq [ingredient1, ingredient2]
    end
  end

end
