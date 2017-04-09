local Proto = require 'libs/proto'

local base = Proto.newFrom(data.raw['recipe']['sulfur'], {
  name = 'alien-goop-cracking-congelation',
  energy_required = 30,
  main_product = "",
  icon = '__base__/graphics/icons/alien-artifact.png',
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

-- gems: bobplates (config option?)
-- extra artifacts: bobenemies
-- ext. crafting: bobenemies
-- spore crafting: 