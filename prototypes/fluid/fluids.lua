local goop = newTableFrom(data.raw['fluid']['lubricant'], {
  name = 'alien-goop-cracking-goop',
  base_color = {r=0.9, g=0.2, b=0.8}, -- #E435C9, rounded
  flow_color = {r=1.0, g=0.8, b=1.0}, -- #FFD3FF, rounded
  icon = '__AlienGoopCracking__/graphics/goop.png'
})

data:extend {goop}