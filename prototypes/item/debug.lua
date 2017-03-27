local placeWell = {
  type = "item",
  name = "alien-goop-cracking-debug",
  icon = "__AlienGoopCracking__/graphics/goop.png",
  flags = {"goes-to-quickbar"},
  subgroup = "raw-resource",
  order = "b[pipe]-c[small-pump]",
  place_result = "alien-goop-cracking-goop",
  stack_size = 100
}

data:extend {placeWell}