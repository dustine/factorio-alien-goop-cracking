local Proto = require 'libs/proto'

local baseNeeded = true

if angelsmods and angelsmods.refining then
  baseNeeded = false

  angelsmods.functions.make_barrel('alien-goop-cracking-goop', 'alien-goop-cracking', 'z', 'water')

  -- remove the new rogue barrel and replace our barrel graphic with angel's
  local barrelIcon = data.raw['item']['angels-barrel-alien-goop-cracking-goop'].icons
  data.raw['item']['angels-barrel-alien-goop-cracking-goop'] = nil
  data.raw['item']['alien-goop-cracking-barrel'].icon = nil
  data.raw['item']['alien-goop-cracking-barrel'].icons = table.deepcopy(barrelIcon)
  -- update the auto-gen recipes to not use the rogue barrel
  data.raw['recipe']['angels-empty-alien-goop-cracking-goop-barrel'].ingredients[1].name = 'alien-goop-cracking-barrel'
  data.raw['recipe']['angels-fill-alien-goop-cracking-goop-barrel'].results[1].name = 'alien-goop-cracking-barrel'
end

if bobmods and bobmods.plates then
  baseNeeded = false

  local fill = Proto.newFrom(data.raw['recipe']['fill-crude-oil-barrel'], {
    name = 'alien-goop-cracking-fill-bob-barrel',
    icon = '__AlienGoopCracking__/graphics/fill-barrel.png',
    category = "water-pump",
    subgroup = "bob-barrel",
  })
  fill.ingredients = {
    {type="fluid", name="alien-goop-cracking-goop", amount=25},
    {type="item", name="empty-barrel", amount=1},
  }
  fill.results = {
    {type="item", name="alien-goop-cracking-barrel", amount=1}
  }

  local empty = Proto.newFrom(data.raw['recipe']['empty-crude-oil-barrel'], {
    name = 'alien-goop-cracking-empty-bob-barrel',
    icon = '__AlienGoopCracking__/graphics/empty-barrel.png',
    category = "water-pump",
    subgroup = "bob-empty-barrel",
  })
  empty.ingredients = {
    {type="item", name="alien-goop-cracking-barrel", amount=1}
  }
  empty.results = {
    {type="fluid", name="alien-goop-cracking-goop", amount=25},
    {type="item", name="empty-barrel", amount=1},
  }

  table.insert(data.raw['technology']['barrels'].effects, {
    type = 'unlock-recipe',
    recipe = fill.name
  })
  table.insert(data.raw['technology']['barrels'].effects, {
    type = 'unlock-recipe',
    recipe = empty.name
  })

  data:extend {fill, empty}
end

if not baseNeeded then
  -- hide the recipes if they're already unlocked
  data.raw['recipe']['alien-goop-cracking-fill-barrel'].hidden = true
  data.raw['recipe']['alien-goop-cracking-empty-barrel'].hidden = true
  -- data.raw['recipe']['alien-goop-cracking-fill-barrel'].enabled = false
  -- data.raw['recipe']['alien-goop-cracking-empty-barrel'].enabled = false

  -- remove them from the fluid-handling research
  for i, effect in pairs(data.raw['technology']['fluid-handling'].effects) do
    if effect.type == 'unlock-recipe' and effect.recipe == 'alien-goop-cracking-fill-barrel' then
      table.remove(data.raw['technology']['fluid-handling'].effects, i)
      break
    end
  end
  for i, effect in pairs(data.raw['technology']['fluid-handling'].effects) do
    if effect.type == 'unlock-recipe' and effect.recipe == 'alien-goop-cracking-empty-barrel' then
      table.remove(data.raw['technology']['fluid-handling'].effects, i)
      break
    end
  end
end
