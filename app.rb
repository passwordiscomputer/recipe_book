require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload("lib/**/*.rb")
require("./lib/ingredients_recipes")
require("./lib/ingredient")
require("./lib/recipe")
require("./lib/tag")
require("pry")

get('/')do
  erb(:home)
end

get('/home')do
  erb(:home)
end

get('/recipes')do
  @recipes = Recipe.all
  erb(:recipes)
end

post('/recipes')do
  title = params[:title]
  @recipe = Recipe.create({:title => title})
  @recipes = Recipe.all
  erb(:recipes)
end

get('/recipes/:id')do
  @recipe = Recipe.find(params.fetch("id").to_i())
  @ingredients = Ingredient.all - @recipe.ingredients
  erb(:recipe_edit)
end

get('/ingredients')do
  @ingredients = Ingredient.all
  erb(:ingredients)
end

post('/ingredients')do
  name = params[:name]
  @ingredient = Ingredient.create({:name => name})
  @ingredients = Ingredient.all
  erb(:ingredients)
end

patch('/recipes/:id') do
  @recipe = Recipe.find(params.fetch("id").to_i())
  ingredient_ids = params['ingredient_ids'] || [] # 'or' statement, returns empty array if no ingredients checked
  ingredient_ids.each do |ingredient_id|
    new_ingredient = Ingredient.find(ingredient_id)
    @recipe.ingredients.push(new_ingredient)
  end
  @ingredients = Ingredient.all - @recipe.ingredients
  erb(:recipe_edit)
end

delete('/recipes/:id') do # deletes ingredient from recipe
  @recipe = Recipe.find(params.fetch("id").to_i())
  ingredient_id_delete = params[:ingredient_id_delete]
  @recipe.ingredients.destroy(ingredient_id_delete.to_i)
  @ingredients = Ingredient.all - @recipe.ingredients
  erb(:recipe_edit)
end

get('/tags') do
  @tags = Tag.all
  erb(:tags)
end










# end
