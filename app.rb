require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload("lib/**/*.rb")
require("./lib/ingredients_recipes")
require("./lib/ingredient")
require("./lib/recipe")
require("pry")

get('/')do
  erb(:home)
end

get('/home')do
  erb(:home)
end

get('/recipes')do
  erb(:recipes)
end
