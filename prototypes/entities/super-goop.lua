local well = data.extend(table.deepcopy(data.raw['resource']['alien-goop-cracking-goop']), {
  name = 'alien-goop-cracking-super-goop',
  stages = {sheet = {filename = '__AlienGoopCracking__/graphics/super-goop-world.png'}},
  minable = {mining_time = 0.2},
  map_color = {r=1.0, g=1.0, b=1.0},
})

data:extend {well}