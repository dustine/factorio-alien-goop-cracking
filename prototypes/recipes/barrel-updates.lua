--Only run this if water pump or heavy pump is present.
local water_pump = data.raw.item["water-pump"]
local heavy_pump = data.raw.item["heavy-pump"]
local fill = data.raw.recipe["alien-goop-cracking-fill-barrel"]
local empty = data.raw.recipe["alien-goop-cracking-empty-barrel"]
if (bobmods and water_pump) or (angelsmods and heavy_pump) then

    --remove from base tech
    local function remove_tech()
        local techs = data.raw.technology["fluid-handling"] or {}
        for _, tech in pairs(techs) do
            for i = #tech.effects, 1, -1 do
                local effect = tech.effects[i]
                if effect.type == "unlock-recipe" and effect.recipe:find("alien%-goop%-cracking%-") then
                    tech.effect[i] = nil
                end
            end
        end
    end

    --Create recipe for angels or bobs. Check angels first
    if heavy_pump then
        fill.category = "heavy-pump"
        fill.subgroup = "water"
        empty.category = "heavy-pump"
        empty.subgroup = "water"
        data.raw.item["alien-goop-cracking-barrel"].subgroup = "water"

    elseif water_pump then
        fill.category = "water-pump"
        fill.subgroup = "bob-barrel"
        empty.category = "water-pump"
        empty.subgroup = "bob-empty-barrel"
        data.raw.item["alien-goop-cracking-barrel"].subgroup = "bob-barrel"

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
