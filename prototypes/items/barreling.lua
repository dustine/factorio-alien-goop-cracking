local Proto = require 'libs/proto'

local barrel = Proto.newFrom(data.raw['item']['crude-oil-barrel'], {
  name = 'alien-goop-cracking-barrel',
  icon = '__AlienGoopCracking__/graphics/barrel.png'
})


local recipeFillBase = Proto.newFrom(data.raw['recipe']['fill-crude-oil-barrel'], {
  name = 'alien-goop-cracking-fill-barrel',
  energy_required = 1,
  icon = '__AlienGoopCracking__/graphics/fill-barrel.png',
})
recipeFillBase.ingredients = {
  {type="fluid", name="alien-goop-cracking-goop", amount=25},
  {type="item", name="empty-barrel", amount=1},
}
recipeFillBase.results = {
  {type="item", name="alien-goop-cracking-barrel", amount=1}
}


local recipeEmptyBase = Proto.newFrom(data.raw['recipe']['empty-crude-oil-barrel'], {
  name = 'alien-goop-cracking-empty-barrel',
  energy_required = 1,
  icon = '__AlienGoopCracking__/graphics/empty-barrel.png'
})

recipeEmptyBase.ingredients = {
  {type="item", name="alien-goop-cracking-barrel", amount=1}
}
recipeEmptyBase.results = {
  {type="fluid", name="alien-goop-cracking-goop", amount=25},
  {type="item", name="empty-barrel", amount=1}
}


table.insert(data.raw['technology']['fluid-handling'].effects, {
  type = 'unlock-recipe',
  recipe = 'alien-goop-cracking-fill-barrel'
})
table.insert(data.raw['technology']['fluid-handling'].effects, {
  type = 'unlock-recipe',
  recipe = 'alien-goop-cracking-empty-barrel'
})

data:extend {barrel, recipeEmptyBase, recipeFillBase}