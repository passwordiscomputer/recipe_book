require("spec_helper")
require('pry')

describe(Ingredient) do

  describe "#ingredients" do
    it "lists all ingredients" do
      ingredient1 = Ingredient.create({:name => "sassafrass"})
      ingredient2 = Ingredient.create({:name => "coffee"})
      expect(Ingredient.all).to eq [ingredient1, ingredient2]
    end
  end

  it "ensures ingredient name contains only letters" do
    ingredient = Ingredient.create({:name => "efgABC"})
    expect(ingredient.save).to eq true
  end

end
