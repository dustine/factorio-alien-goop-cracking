local barrel = newTableFrom(data.raw['item']['crude-oil-barrel'], {
  name = 'alien-goop-cracking-barrel',
  icon = '__AlienGoopCracking__/graphics/barrel.png'
})

local cottonCandy = newTableFrom(data.raw['capsule']['raw-fish'], {
  name = 'alien-goop-cracking-cotton-candy',
  capsule_action = {attack_parameters = {ammo_type = {action = {action_delivery = {target_effects = {damage = {amount = -100}}}}}}},
  order = "g[alien-artifact]-a[cotton-candy]",
  icon = '__AlienGoopCracking__/graphics/cotton-candy.png'
})

data:extend {barrel, cottonCandy}