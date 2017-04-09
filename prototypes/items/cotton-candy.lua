local Proto = require 'libs/proto'

local item = Proto.newFrom(data.raw['capsule']['raw-fish'], {
  name = 'alien-goop-cracking-cotton-candy',
  capsule_action = {attack_parameters = {ammo_type = {action = {
    action_delivery = {target_effects = {damage = {amount = -100}}}
  }}}},
  order = "g[alien-artifact]-a[cotton-candy]",
  icon = '__AlienGoopCracking__/graphics/cotton-candy.png'
})


local recipe = Proto.newFrom(data.raw['recipe']['empty-crude-oil-barrel'], {
  name = 'alien-goop-cracking-cotton-candy',
  subgroup = "raw-material",
  order = "h[alien-artifact]-a[cotton-candy]",
  energy_required = 1800,
  icon = '__AlienGoopCracking__/graphics/cotton-candy.png',
})
recipe.ingredients = {
  {type='fluid', name='alien-goop-cracking-goop', amount=20},
  {type="item", name="raw-fish", amount=1},
}
recipe.results = {
  {type='item', name='alien-goop-cracking-cotton-candy', amount=1}
};


table.insert(data.raw['technology']['alien-technology'].effects, {
  type = 'unlock-recipe',
  recipe = 'alien-goop-cracking-cotton-candy'
})


local achievement = {
  type = 'produce-per-hour-achievement',
  name = 'alien-goop-cracking-sweet-tooth',
  item_product= 'alien-goop-cracking-cotton-candy',
  amount = 60,
  order = 'g[secret]-b[sweet-tooth]',
  icon = '__AlienGoopCracking__/graphics/achievement.png',
  limited_to_one_game = false
}

data:extend {item, recipe, achievement}