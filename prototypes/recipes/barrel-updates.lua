-- Thank you to @Nexela

--Only run this if water pump or heavy pump is present.
local water_pump = data.raw.item["water-pump"]
local angelbarreling = data.raw["recipe-category"]["angels-barreling"]

local barrel = data.raw.item["alien-goop-cracking-barrel"]
local fill = data.raw.recipe["alien-goop-cracking-fill-barrel"]
local empty = data.raw.recipe["alien-goop-cracking-empty-barrel"]
if (bobmods and water_pump) or (angelsmods and angelbarreling) then
  --remove from base tech
  local function remove_tech()
    local techs = data.raw.technology["fluid-handling"] or {}
    for _, tech in pairs({techs}) do
      for i = #tech.effects, 1, -1 do
        local effect = tech.effects[i]
        if effect and effect.type == "unlock-recipe" and effect.recipe:find("alien%-goop%-cracking%-") then
          tech.effects[i] = nil
        end
      end
    end
  end

  --Create recipe for angels or bobs. Check angels first
  if angelbarreling then
    if not data.raw["item-subgroup"]["bob-fluid-empty"] then
      data:extend({{
        type = "item-subgroup",
        name = "bob-fluid-fill",
        group = "angels-barrels",
        order = "zza",
      },{
        type = "item-subgroup",
        name = "bob-fluid-empty",
        group = "angels-barrels",
        order = "zzb",
      }})
    end
    fill.category = "angels-barreling"
    fill.subgroup = "bob-fluid-fill"
    empty.category = "angels-barreling"
    empty.subgroup = "bob-fluid-empty"
    barrel.subgroup = "bob-fluid-empty"

    if data.raw['technology']['angels-fluid-barreling'] then
      remove_tech()
      table.insert(data.raw['technology']['angels-fluid-barreling'].effects, {
        type = 'unlock-recipe',
        recipe = fill.name
      })
      table.insert(data.raw['technology']['angels-fluid-barreling'].effects, {
        type = 'unlock-recipe',
        recipe = empty.name
      })
    end
  elseif water_pump then
    fill.category = "water-pump"
    fill.subgroup = "bob-barrel"
    empty.category = "water-pump"
    empty.subgroup = "bob-empty-barrel"
    barrel.subgroup = "bob-barrel"

    if data.raw['technology']['barrels'] then
      remove_tech()
      table.insert(data.raw['technology']['barrels'].effects, {
        type = 'unlock-recipe',
        recipe = fill.name
      })
      table.insert(data.raw['technology']['barrels'].effects, {
        type = 'unlock-recipe',
        recipe = empty.name
      })
    end
  end
end
