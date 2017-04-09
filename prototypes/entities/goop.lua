local Proto = require 'libs/proto'

local well = Proto.newFrom(data.raw['resource']['crude-oil'], {
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

local fluid = Proto.newFrom(data.raw['fluid']['lubricant'], {
  name = 'alien-goop-cracking-goop',
  base_color = {r=0.9, g=0.2, b=0.8}, -- #E435C9, rounded
  flow_color = {r=1.0, g=0.8, b=1.0}, -- #FFD3FF, rounded
  icon = '__AlienGoopCracking__/graphics/goop.png'
})

data:extend {well, fluid}