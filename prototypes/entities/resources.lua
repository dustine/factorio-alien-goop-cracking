local well = newTableFrom(data.raw['resource']['crude-oil'], {
  name = 'alien-goop-cracking-goop',
  order = 'a-b-b',
  minimum = aliengoopcracking.minimumGoop,
  normal = aliengoopcracking.baselineGoop,
  minable = {results = {{name = 'alien-goop-cracking-goop'}}},
  map_color = {r=1.0, g=0.0, b=0.0},
  icon = '__AlienGoopCracking__/graphics/goop.png',
  stages = {sheet = {filename = '__AlienGoopCracking__/graphics/goop-world.png'}}
})
well.autoplace = nil

local boostedWell = newTableFrom(well, {
  name = 'alien-goop-cracking-super-goop',
  stages = {sheet = {filename = '__AlienGoopCracking__/graphics/super-goop-world.png'}},
  minable = {mining_time = 0.2},
  map_color = {r=1.0, g=1.0, b=1.0},
})

data:extend {well, boostedWell}