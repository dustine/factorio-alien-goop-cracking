function rewriteRecipe(recipe, ingredients, results)
  recipe.ingredients = ingredients
  recipe.results = results
end

local congelation = newTableFrom(data.raw['recipe']['sulfur'], {
  name = 'alien-goop-cracking-congelation',
  energy_required = 30,
  main_product = "",
  icon = '__base__/graphics/icons/alien-artifact.png',
  subgroup = "raw-material",
  order = "h[alien-artifact]"
})
rewriteRecipe(congelation, {
  {type='fluid', name='alien-goop-cracking-goop', amount=5},
  {type='item', name='stone', amount=8}
}, {
  {type='item', name='alien-artifact', amount=1}
})

-- adds support for productivity modules
for k,v in pairs({'productivity-module', 'productivity-module-2', 'productivity-module-3'}) do
  table.insert(data.raw['module'][v].limitation, 'alien-goop-cracking-congelation')
end


local cottonCandy = newTableFrom(data.raw['recipe']['empty-crude-oil-barrel'], {
  name = 'alien-goop-cracking-cotton-candy',
  subgroup = "raw-material",
  order = "h[alien-artifact]-a[cotton-candy]",
  energy_required = 1800,
  icon = '__AlienGoopCracking__/graphics/cotton-candy.png',
})
rewriteRecipe(cottonCandy, {
  {type='fluid', name='alien-goop-cracking-goop', amount=20}, 
  {type="item", name="raw-fish", amount=1},
}, {
  {type='item', name='alien-goop-cracking-cotton-candy', amount=1}
});


local barrel = newTableFrom(data.raw['recipe']['fill-crude-oil-barrel'], {
  name = 'alien-goop-cracking-fill-barrel',
  energy_required = 1,
  icon = '__AlienGoopCracking__/graphics/fill-barrel.png',
})
rewriteRecipe(barrel, {
  {type="fluid", name="alien-goop-cracking-goop", amount=25},
  {type="item", name="empty-barrel", amount=1},
}, {
  {type="item", name="alien-goop-cracking-barrel", amount=1}
})


local unbarrel = newTableFrom(data.raw['recipe']['empty-crude-oil-barrel'], {
  name = 'alien-goop-cracking-empty-barrel',
  energy_required = 1,
  icon = '__AlienGoopCracking__/graphics/empty-barrel.png'
})
rewriteRecipe(unbarrel, {
  {type="item", name="alien-goop-cracking-barrel", amount=1}
}, {
  {type="fluid", name="alien-goop-cracking-goop", amount=25},
  {type="item", name="empty-barrel", amount=1}
})

data:extend {congelation, cottonCandy, barrel, unbarrel}