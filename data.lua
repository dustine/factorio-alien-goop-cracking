local config = require 'config'

config.goopToArtifact = 5;

function union(lht, rht)
    for k, v in pairs(rht) do
        if (type(v) == "table") and (type(lht[k] or false) == "table") then
            union(lht[k], rht[k])
        else
            lht[k] = v
        end
    end
    return lht
end

function newTableFrom(original, parameters)
  local newObject = table.deepcopy(original)
  return union(newObject, parameters)
end


-- Achievements

local achievement = {
  type = 'produce-per-hour-achievement',
  name = 'aliengoopcracking-sweet-tooth',
  item_product= 'aliengoopcracking-cotton-candy',
  amount = 60,
  order = 'g[secret]-b[sweet-tooth]',
  icon = '__aliengoopcracking__/graphics/achievement.png',
  limited_to_one_game = false
}


-- Entity

local well = newTableFrom(data.raw['resource']['crude-oil'], {
  name = 'aliengoopcracking-goop',
  order = 'a-b-b',
  minimum = config.minimumGoop,
  normal = config.baselineGoop,
  minable = {results = {{name = 'aliengoopcracking-goop'}}},
  map_color = {r=1.0, g=0.0, b=0.0},
  icon = '__aliengoopcracking__/graphics/goop.png',
  stages = {sheet = {filename = '__aliengoopcracking__/graphics/goop-world.png'}}
})
well.autoplace = nil


-- Fluid

local goop = newTableFrom(data.raw['fluid']['lubricant'], {
  name = 'aliengoopcracking-goop',
  base_color = {r=0.9, g=0.2, b=0.8}, -- #E435C9, rounded
  flow_color = {r=1.0, g=0.8, b=1.0}, -- #FFD3FF, rounded
  icon = '__aliengoopcracking__/graphics/goop.png'
})

-- Item

local itemCC = newTableFrom(data.raw['capsule']['raw-fish'], {
  name = 'aliengoopcracking-cotton-candy',
  capsule_action = {attack_parameters = {ammo_type = {action = {action_delivery = {target_effects = {damage = {amount = -100}}}}}}},
  order = "g[alien-artifact]-a[cotton-candy]",
  icon = '__aliengoopcracking__/graphics/cotton-candy.png'
})

local itemBarrel = newTableFrom(data.raw['item']['crude-oil-barrel'], {
  name = 'aliengoopcracking-barrel',
  icon = '__aliengoopcracking__/graphics/barrel.png'
})


-- Recipe

function rewriteRecipe(recipe, ingredients, results)
  recipe.ingredients = ingredients
  recipe.results = results
end

local congelation = newTableFrom(data.raw['recipe']['sulfur'], {
  name = 'aliengoopcracking-congelation',
  energy_required = 30,
  main_product = "",
  icon = '__base__/graphics/icons/alien-artifact.png',
  subgroup = "raw-material",
  order = "h[alien-artifact]"
})
rewriteRecipe(congelation, {
  {type='fluid', name='aliengoopcracking-goop', amount=config.goopToArtifact},
  {type='item', name='stone', amount=8}
}, {
  {type='item', name='alien-artifact', amount=1}
})

local recipeCC = newTableFrom(data.raw['recipe']['empty-crude-oil-barrel'], {
  name = 'aliengoopcracking-cotton-candy',
  subgroup = "raw-material",
  order = "h[alien-artifact]-a[cotton-candy]",
  energy_required = 1800,
  icon = '__aliengoopcracking__/graphics/cotton-candy.png',
})
rewriteRecipe(recipeCC, {
  {type='fluid', name='aliengoopcracking-goop', amount=config.goopToArtifact*4}, 
  {type="item", name="raw-fish", amount=1},
}, {
  {type='item', name='aliengoopcracking-cotton-candy', amount=1}
});

local recipeBarrel = newTableFrom(data.raw['recipe']['fill-crude-oil-barrel'], {
  name = 'aliengoopcracking-fill-barrel',
  energy_required = 1,
  icon = '__aliengoopcracking__/graphics/fill-barrel.png',
})
rewriteRecipe(recipeBarrel, {
  {type="fluid", name="aliengoopcracking-goop", amount=25},
  {type="item", name="empty-barrel", amount=1},
}, {
  {type="item", name="aliengoopcracking-barrel", amount=1}
})

local unbarrel = newTableFrom(data.raw['recipe']['empty-crude-oil-barrel'], {
  name = 'aliengoopcracking-empty-barrel',
  energy_required = 1,
  icon = '__aliengoopcracking__/graphics/empty-barrel.png'
})
rewriteRecipe(unbarrel, {
  {type="item", name="aliengoopcracking-barrel", amount=1}
}, {
  {type="fluid", name="aliengoopcracking-goop", amount=25},
  {type="item", name="empty-barrel", amount=1}
})

-- adds support for productivity modules
for k,v in pairs({'productivity-module', 'productivity-module-2', 'productivity-module-3'}) do
  table.insert(data.raw['module'][v].limitation, 'aliengoopcracking-congelation')
end


-- Technology

table.insert(data.raw['technology']['alien-technology'].effects, {
  type = 'unlock-recipe',
  recipe = 'aliengoopcracking-congelation'
})
table.insert(data.raw['technology']['alien-technology'].effects, {
  type = 'unlock-recipe',
  recipe = 'aliengoopcracking-cotton-candy'
})
table.insert(data.raw['technology']['fluid-handling'].effects, {
  type = 'unlock-recipe',
  recipe = 'aliengoopcracking-fill-barrel'
})
table.insert(data.raw['technology']['fluid-handling'].effects, {
  type = 'unlock-recipe',
  recipe = 'aliengoopcracking-empty-barrel'
})


data:extend{achievement, well, goop, itemCC, itemBarrel, congelation, recipeCC, recipeBarrel, unbarrel}
