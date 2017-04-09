local Proto = require 'libs/proto'

local barrel = Proto.newFrom(data.raw['item']['crude-oil-barrel'], {
  name = 'alien-goop-cracking-barrel',
  icon = '__AlienGoopCracking__/graphics/barrel.png'
})

local fill = Proto.newFrom(data.raw['recipe']['fill-crude-oil-barrel'], {
  name = 'alien-goop-cracking-fill-barrel',
  icon = '__AlienGoopCracking__/graphics/fill-barrel.png',
})
fill.ingredients = {
  {type="fluid", name="alien-goop-cracking-goop", amount=25},
  {type="item", name="empty-barrel", amount=1},
}
fill.results = {
  {type="item", name="alien-goop-cracking-barrel", amount=1}
}


local empty = Proto.newFrom(data.raw['recipe']['empty-crude-oil-barrel'], {
  name = 'alien-goop-cracking-empty-barrel',
  icon = '__AlienGoopCracking__/graphics/empty-barrel.png'
})
empty.ingredients = {
  {type="item", name="alien-goop-cracking-barrel", amount=1}
}
empty.results = {
  {type="fluid", name="alien-goop-cracking-goop", amount=25},
  {type="item", name="empty-barrel", amount=1},
}

table.insert(data.raw['technology']['fluid-handling'].effects, {
  type = 'unlock-recipe',
  recipe = fill.name
})
table.insert(data.raw['technology']['fluid-handling'].effects, {
  type = 'unlock-recipe',
  recipe = empty.name
})

data:extend {barrel, fill, empty}