local angelsbioprocessing = (game.entity_prototypes["algae-farm"] and game.item_prototypes["blue-cellulose-fiber"]) or nil
local angelsrefining = game.item_prototypes["angels-ore1-crushed"] or nil
local bobplates = (game.entity_prototypes["water-pump"] and game.item_prototypes["alien-blue-alloy"]) or nil
local bobenemies = game.entity_prototypes["bob-biter-spawner"] or nil

if game.entity_prototypes["alien-bacteria"] then angelsbioprocessing = true end

if angelsbioprocessing or angelsrefining or bobplates or bobenemies then
  for _, force in pairs(game.forces) do
    local technologies = force.technologies
    local recipes = force.recipes

    -- fix barrel recipes
    if bobplates or angelsrefining then
      local fill = recipes['alien-goop-cracking-fill-barrel']
      local empty = recipes['alien-goop-cracking-empty-barrel']

      fill.enabled = false
      empty.enabled = false

      if angelsrefining then
        if technologies['angels-fluid-barreling'] and technologies['angels-fluid-barreling'].researched then
          fill.enabled = true
          empty.enabled = true
        end
      elseif bobplates then
        if technologies['barrels'] and technologies['barrels'].researched then
          fill.enabled = true
          empty.enabled = true
        end
      end

      force.reset_recipes()
    end

    -- add new rainbow congealing
    if bobenemies then
      if technologies['alien-technology'].researched then
        recipes['alien-goop-cracking-rainbow-congelation'].enabled = true
      end
    end

    -- add new bacteria recipe
    if angelsbioprocessing then
      if technologies['alien-technology'].researched then
        recipes['alien-goop-cracking-bacteria'].enabled = true
      end
    end

    force.reset_technologies()
  end
end
