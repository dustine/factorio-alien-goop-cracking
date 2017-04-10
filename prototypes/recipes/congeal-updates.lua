if angelsmods and angelsmods.bioprocessing then
  local congeal = data.raw.recipe['alien-goop-cracking-congelation']
  local rainbow = data.raw.recipe['alien-goop-cracking-rainbow-congelation']
  congeal.subgroup = "bio-processing-alien-big"
  rainbow.icons[2].icon = "__AlienGoopCracking__/graphics/rainbow-angel.png"
  rainbow.subgroup = "bio-processing-alien-big"
end