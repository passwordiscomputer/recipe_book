require("spec_helper")
require('pry')

describe(Recipe) do

  it "ensures input field is not empty" do
    recipe = Recipe.create({:title => ""})
    expect(recipe.save).to eq false
  end
  it("converts the name to lowercase") do
    recipe = Recipe.create({:title => "CHICKEN PARM"})
    expect(recipe.title()).to(eq("chicken parm"))
  end
end
