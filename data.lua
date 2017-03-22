-- Achievements

local achievement = {
  type = 'achievement',
  name = 'aliengoopcracking-sweet-tooth',
  order = 'g[secret]-b[sweet-tooth]',
  icon = '__base__/graphics/achievement/so-long-and-thanks-for-all-the-fish.png'
}


-- Entity

local well = table.deepcopy(data.raw['resource']['crude-oil'])
well.name = 'aliengoopcracking-goop'
well.minable.results[1].name = 'aliengoopcracking-goop'
-- well.autoplace = nil
well.map_color = {r=1.0, g=0.0, b=0.0} -- biter-red?


-- Fluid

local goop = table.deepcopy(data.raw['fluid']['lubricant'])
goop.name = 'aliengoopcracking-goop'
goop.base_color = {r=0.9, g=0.2, b=0.8} -- #E435C9, rounded
goop.flow_color = {r=1.0, g=0.8, b=1.0} -- #FFD3FF, rounded


-- Item

local itemCC = table.deepcopy(data.raw['capsule']['raw-fish'])
itemCC.name = 'aliengoopcracking-cotton-candy'
itemCC.capsule_action.attack_parameters.ammo_type.action.action_delivery.target_effects.damage.amount = 100
itemCC.order = "g[alien-artifact]-a[cotton-candy]"

local itemBarrel = table.deepcopy(data.raw['item']['crude-oil-barrel'])
itemBarrel.name = 'aliengoopcracking-fill-barrel'


-- Recipe

local congelation = table.deepcopy(data.raw['recipe']['sulfuric-acid'])
congelation.name = 'aliengoopcracking-congelation'
congelation.energy_required = 30
congelation.ingredients = {
  {type='fluid', name='aliengoopcracking-goop', amount=60}
}
congelation.results = {
  {type='item', name='alien-artifact', ammount=1}
}

local recipeCC = table.deepcopy(data.raw['recipe']['empty-crude-oil-barrel'])
recipeCC.name = 'aliengoopcracking-cotton-candy'
recipeCC.energy_required = 1800
recipeCC.ingredients = {
  {type='fluid', name='aliengoopcracking-goop', amount=60},
  {type="item", name="fish", amount=1},
}
recipeCC.results = {
  {type='item', name='aliengoopcracking-cotton-candy', ammount=1}
}

local recipeBarrel = table.deepcopy(data.raw['recipe']['fill-crude-oil-barrel'])
recipeBarrel.name = 'aliengoopcracking-fill-barrel'
recipeBarrel.energy_required = 1
recipeBarrel.ingredients = {
  {type="fluid", name="aliengoopcracking-goop", amount=25},
  {type="item", name="empty-barrel", amount=1},
}
recipeBarrel.results = {
  {type="item", name="aliengoopcracking-fill-barrel", amount=1}
}

local unbarrel = table.deepcopy(data.raw['recipe']['empty-crude-oil-barrel'])
unbarrel.name = 'aliengoopcracking-empty-barrel'
unbarrel.energy_required = 1
unbarrel.ingredients = {
  {type="item", name="aliengoopcracking-fill-barrel", amount=1}
}
unbarrel.results = {
  {type="fluid", name="aliengoopcracking-goop", amount=25},
  {type="item", name="empty-barrel", amount=1}
}


-- Technology

table.insert(data.raw['technology']['alien-technology'].effects, {
  type = 'unlock-recipe',
  recipe = 'aliengoopcracking-congelation'
})
table.insert(data.raw['technology']['alien-technology'].effects, {
  type = 'unlock-recipe',
  recipe = 'aliengoopcracking-cotton-candy'
})
table.insert(data.raw['technology']['alien-technology'].effects, {
  type = 'unlock-recipe',
  recipe = 'aliengoopcracking-fill-barrel'
})
table.insert(data.raw['technology']['alien-technology'].effects, {
  type = 'unlock-recipe',
  recipe = 'aliengoopcracking-empty-barrel'
})


data:extend{achievement, well, goop, itemCC, itemBarrel, congelation, recipeCC, recipeBarrel, unbarrel}

