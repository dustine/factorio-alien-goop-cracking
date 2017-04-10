local Proto = require 'libs/proto'

local base = Proto.newFrom(data.raw['recipe']['sulfur'], {
  name = 'alien-goop-cracking-congelation',
  energy_required = 30,
  -- main_product = "",
  -- icon = '__base__/graphics/icons/alien-artifact.png',
  subgroup = "raw-material",
  order = "h[alien-artifact]"
})
base.ingredients = {
  {type='fluid', name='alien-goop-cracking-goop', amount=5},
  {type='item', name='stone', amount=8}
}
base.results = {
  {type='item', name='alien-artifact', amount=1}
}

-- adds support for productivity modules
for _,recipe in pairs({'productivity-module', 'productivity-module-2', 'productivity-module-3'}) do
  table.insert(data.raw['module'][recipe].limitation, 'alien-goop-cracking-congelation')
end


table.insert(data.raw['technology']['alien-technology'].effects, {
  type = 'unlock-recipe',
  recipe = 'alien-goop-cracking-congelation'
})

data:extend {base}

-- multicolor artifact gathering
if bobmods and bobmods.enemies then
  data:extend {{
    type = "recipe",
    name = "alien-goop-cracking-rainbow-congelation",
    category = "chemistry",
    subgroup = "raw-material",
    enabled = false,
    energy_required = 30,
    ingredients = {
      {type="fluid", name="alien-goop-cracking-goop", amount=60},
      {type="fluid", name="sulfuric-acid", amount=30},
      {type="item", name="coal", amount=96},
      {type="item", name="alien-artifact", amount=12}
    },
    results = {
      {type="fluid", name="light-oil", amount=30},
      {type="item", name="alien-artifact-red", amount_min = 0, amount_max = 1, probability = 0.6},
      {type="item", name="alien-artifact-orange", amount_min = 0, amount_max = 1, probability = 0.6},
      {type="item", name="alien-artifact-yellow", amount_min = 0, amount_max = 1, probability = 0.6},
      {type="item", name="alien-artifact-green", amount_min = 0, amount_max = 1, probability = 0.6},
      {type="item", name="alien-artifact-blue", amount_min = 0, amount_max = 1, probability = 0.6},
      {type="item", name="alien-artifact-purple", amount_min = 0, amount_max = 1, probability = 0.6}
    },
    order = "h[alien-artifact]",
    icons = {{
      icon = data.raw.item['alien-artifact'].icon
    },{
      icon = "__AlienGoopCracking__/graphics/rainbow.png",
      tint = {r = 0.5, g = 0.5, b = 0.5, a = 0.5}
    }}
  }}

  table.insert(data.raw['technology']['alien-technology'].effects, {
    type = 'unlock-recipe',
    recipe = 'alien-goop-cracking-rainbow-congelation'
  })
end